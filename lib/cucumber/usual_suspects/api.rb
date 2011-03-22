require 'cucumber/usual_suspects/identity'

module Cucumber
  module UsualSuspects
    module Api
      # this tells UsualSuspects how to send Transforms to Cucumber
      def transforms_registry=(value)
        @transforms_registry = value
      end
      
      # expands the given regular expression according to any identities that have
      # been remembered
      def expand(regexp)
        result = regexp.to_s
        identities.each do |id|
          result.gsub!("<#{id}>", "(#{id.regexp_string})")
        end
        Regexp.new result
      end

      def remember(description, definition)
        identities << Identity.new(@transforms_registry, description, definition)
      end

    private

      def identities
        @identities ||= []
      end
    end
  end
end