require 'spec_helper'
describe 'glpiagent' do

  context 'with defaults for all parameters' do
    it { should contain_class('glpiagent') }
  end
end
