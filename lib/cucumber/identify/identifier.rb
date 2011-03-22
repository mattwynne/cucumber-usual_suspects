module Cucumber
  module Identify
    class Identifier
      def initialize(runtime, thing, proc)
        @runtime, @thing = runtime, thing
        instance_exec(&proc)
      end
  
      def phrase(regexp, &block)
        transforms << @runtime.register_rb_transform(regexp, block)
      end
  
      def to_s
        @thing
      end
  
      def regexp
        @transforms.map{ |t| t.to_s }.join("|")
      end
    private

      def transforms
        @transforms ||= []
      end
    end
  end
end