module Cucumber
  module UsualSuspects
    module Dsl
      def Identify(thing, &block)
        UsualSuspects.remember(thing, block)
      end
    end
  end
end
extend(Cucumber::UsualSuspects::Dsl)