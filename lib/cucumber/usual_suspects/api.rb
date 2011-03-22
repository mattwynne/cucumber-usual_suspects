require 'cucumber/usual_suspects/identifier'

module Cucumber
  module UsualSuspects
    module Api
      def transforms_registry=(value)
        @transforms_registry = value
      end
      
      def expand(regexp)
        result = regexp.to_s
        identifiers.each do |id|
          result.gsub!("<#{id}>", "(#{id.regexp_string})")
        end
        Regexp.new result
      end

      def remember(description, definition)
        identifiers << Identifier.new(@transforms_registry, description, definition)
      end

    private

      def identifiers
        @identifiers ||= []
      end
    end
  end
end