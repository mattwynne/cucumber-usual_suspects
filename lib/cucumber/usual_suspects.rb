require 'cucumber'
require 'cucumber/usual_suspects/api'

module Cucumber
  module UsualSuspects
    extend Api
    
    module ExpandsStepDefinitionRegexps
      def register_rb_step_definition(regexp, proc)
        expanded_regexp = Cucumber::UsualSuspects.expand(regexp)
        super expanded_regexp, proc
      end
    end
  end
  
  module RbSupport
    module RbDsl
      class << self
        def extend_rb_language_with(extension_module)
          @rb_language.extend(extension_module)
        end
      end
      
      def Identify(thing, &block)
        Cucumber::UsualSuspects.remember(thing, block)
      end
    end
  end
end

Cucumber::UsualSuspects.transforms_registry = Cucumber::RbSupport::RbDsl
Cucumber::RbSupport::RbDsl.extend_rb_language_with(Cucumber::UsualSuspects::ExpandsStepDefinitionRegexps)