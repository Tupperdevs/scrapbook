# Minitest version
# put this file at test/linters or test/support
require 'test_helper'
class RubocopTest < ActiveSupport::TestCase
  describe 'when run over the app' do
    it 'has a clean run' do
      cli    = RuboCop::CLI.new
      result = cli.run(%w(--rails))
      value(result).must_equal 0
    end
  end
end
