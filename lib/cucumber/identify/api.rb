require 'cucumber/identify/identifier'

module Cucumber
  module Identify
    module Api
      def runtime=(value)
        @runtime = value
      end
      
      def expand(regexp)
        result = regexp.to_s
        identifiers.each do |id|
          result.gsub!("<#{id}>", "(#{id.regexp})")
        end
        Regexp.new result
      end

      def remember(thing, proc)
        identifiers << Cucumber::Identify::Identifier.new(@runtime, thing, proc)
      end

    private

      def identifiers
        @identifiers ||= []
      end
    end
  end
end