# Put this file at /test/support/lazy_reporter.rb
#
# On test_helper.rb add:
#
#   require 'minites/reporters'
#   require_relative './support/lazy_reporter.rb'
#   Minitest::Reporters.use! Minitest::Reportees::LazyReporter.new(color: true)
#
module Minitest
  module Reporters
    class LazyReporter < DefaultReporter
      def message_for(test)
        "#{super(test)}\n#{rerun_instructions(test)}"
      end

      def rerun_instructions(test)
        location = test.failure.location.split(':')[0]
        cmd = "ruby -Itest #{location} -n \"#{test.name}\""
        "\n >> to re-run: #{cmd}"
      end
    end
  end
end
