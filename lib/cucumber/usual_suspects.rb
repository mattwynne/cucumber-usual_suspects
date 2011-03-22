require 'cucumber/usual_suspects/api'
require 'cucumber/usual_suspects/cucumber_patches'

module Cucumber
  module UsualSuspects
    extend Api
    self.transforms_registry = Cucumber::RbSupport::RbDsl
    
    module ExpandsStepDefinitionRegexps
      def register_rb_step_definition(regexp, proc)
        expanded_regexp = Cucumber::UsualSuspects.expand(regexp)
        super expanded_regexp, proc
      end
    end
    
    Cucumber::RbSupport::RbDsl.extend_rb_language_with(ExpandsStepDefinitionRegexps)
  end
end

