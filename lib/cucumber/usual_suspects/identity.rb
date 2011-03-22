module Cucumber
  module UsualSuspects
    class Identity
      def initialize(transforms_registry, description, definition)
        @transforms_registry, @description = transforms_registry, description
        instance_exec(&definition)
      end
  
      def described_as(regexp, &block)
        transforms << @transforms_registry.register_rb_transform(regexp, block)
      end
  
      def to_s
        @description
      end
  
      def regexp_string
        @transforms.map{ |t| t.to_s }.join("|")
      end
    private

      def transforms
        @transforms ||= []
      end
    end
  end
end