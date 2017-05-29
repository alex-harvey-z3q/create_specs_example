source 'https://rubygems.org'

group :tests do
  gem 'puppetlabs_spec_helper', :require => false
  gem 'rspec-puppet-utils',     :require => false
end

gem 'facter'

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
