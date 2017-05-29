require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-utils'

RSpec.configure do |c|
  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'
end
