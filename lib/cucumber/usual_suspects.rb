require 'cucumber'
require 'cucumber/usual_suspects/api'

module Cucumber
  module UsualSuspects
    extend Api
  end
  
  module RbSupport
    module RbDsl
      class << self
        def register_rb_step_definition(regexp, proc)
          expanded_regexp = Cucumber::UsualSuspects.expand(regexp)
          @rb_language.register_rb_step_definition(expanded_regexp, proc)
        end
      end
      
      def Identify(thing, &block)
        Cucumber::UsualSuspects.remember(thing, block)
      end
    end
  end
end

Cucumber::UsualSuspects.transforms_registry = Cucumber::RbSupport::RbDsl