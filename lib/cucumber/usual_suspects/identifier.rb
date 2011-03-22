module Cucumber
  module UsualSuspects
    class Identifier
      def initialize(transforms_registry, description, definition)
        @transforms_registry, @description = transforms_registry, description
        instance_exec(&definition)
      end
  
      def phrase(regexp, &block)
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