require 'cucumber'
require 'cucumber/identify/api'

module Cucumber
  module Identify
    extend Api
  end
  
  module RbSupport
    module RbDsl
      class << self
        def register_rb_step_definition(regexp, proc)
          expanded_regexp = Cucumber::Identify.expand(regexp)
          @rb_language.register_rb_step_definition(expanded_regexp, proc)
        end
      end
      
      def Identify(thing, &block)
        Cucumber::Identify.remember(thing, block)
      end
    end
  end
end

Cucumber::Identify.runtime = Cucumber::RbSupport::RbDsl