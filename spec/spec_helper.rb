require_relative "../lib/game"
require_relative "../lib/runner"

if defined? RSpec::Core::Formatters::ProgressFormatter
  RSpec::Core::Formatters::ProgressFormatter.class_eval do
    DOTS = ['✅ ', '⚠️ ', '❌ ']

    def example_passed(example)
      output.print DOTS[0]
    end

    def example_pending(example)
      output.print DOTS[1]
    end

    def example_failed(example)
      output.print DOTS[2]
    end

  end
end