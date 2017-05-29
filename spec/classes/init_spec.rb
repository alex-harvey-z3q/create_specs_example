require 'spec_helper'

describe 'ntp' do
  it {
    is_expected.to compile.with_all_deps
    File.write(
      'catalogs/ntp.before.json',
      PSON.pretty_generate(catalogue)
    )
  }
end
