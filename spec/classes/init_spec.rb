require 'spec_helper'
require 'json'

describe 'ntp' do
  let(:params) do
    {
      "servers" => [
        "0.au.pool.ntp.org",
        "1.au.pool.ntp.org",
        "2.au.pool.ntp.org",
        "3.au.pool.ntp.org"
      ]
    }
  end

  it {
    is_expected.to contain_package('ntp').with({
      'ensure' => 'installed',
    })
  }

  it {
    is_expected.to contain_file('/etc/ntp.conf')
  }

  [

"driftfile /var/lib/ntp/drift
restrict default kod nomodify notrap nopeer noquery
restrict 127.0.0.1 
server 0.au.pool.ntp.org
server 1.au.pool.ntp.org
server 2.au.pool.ntp.org
server 3.au.pool.ntp.org
includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
",

  ].map{|k| k.split("\n")}.each do |text|

    it {
      verify_contents(catalogue, '/etc/ntp.conf', text)
    }
  end

  it {
    is_expected.to contain_service('ntp').with({
      'ensure' => 'running',
      'enable' => 'true',
    })
  }

  it 'classes and their relationships' do
    is_expected.to contain_class('ntp::install').with({'before' => ['Class[Ntp::Configure]']})
    is_expected.to contain_class('ntp::configure').with({'notify' => ['Class[Ntp::Service]']})
    is_expected.to contain_class('ntp::service')
  end

  it {
    is_expected.to compile.with_all_deps
    File.write(
      'catalogs/ntp.after_stage2.json',
      PSON.pretty_generate(catalogue)
    )
  }

  at_exit { RSpec::Puppet::Coverage.report! }
end
