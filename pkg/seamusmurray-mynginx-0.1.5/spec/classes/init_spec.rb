require 'spec_helper'
describe 'mynginx' do

  context 'with defaults for all parameters' do
    it { should contain_class('mynginx') }
  end
end
