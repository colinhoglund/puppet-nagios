require 'spec_helper'
describe 'nagios' do

  context 'with defaults for all parameters' do
    it { should contain_class('nagios') }
  end
end
