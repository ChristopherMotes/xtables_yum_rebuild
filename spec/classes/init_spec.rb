require 'spec_helper'
describe 'xtables_yum_rebuild' do
  context 'with default values for all parameters' do
    it { should contain_class('xtables_yum_rebuild') }
  end
end
