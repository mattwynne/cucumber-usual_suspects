module Cucumber
  module RbSupport
    module RbDsl
      class << self
        def extend_rb_language_with(extension_module)
          @rb_language.extend(extension_module)
        end
      end
    end
  end
end
