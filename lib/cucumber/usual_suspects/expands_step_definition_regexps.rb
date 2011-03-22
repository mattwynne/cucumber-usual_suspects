module Cucumber
  module UsualSuspects
    module ExpandsStepDefinitionRegexps
      def register_rb_step_definition(regexp, proc)
        expanded_regexp = Cucumber::UsualSuspects.expand(regexp)
        super expanded_regexp, proc
      end
    end
  end
end
