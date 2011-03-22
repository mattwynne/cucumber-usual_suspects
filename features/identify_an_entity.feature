Feature: Identify an entity
  In order to make step definitions more maintainable
  As a cucumber test developer
  I want a way to abstract out all the different ways of identifying domain entities
  
  Scenario: 
    Given a file named "features/step_definitions/steps.rb" with:
      """
      $: << File.dirname(__FILE__) + '/../../../../lib'
      require 'cucumber/usual_suspects'
      
      class Person < Struct.new(:age, :name)
        def to_s
          'I am a Person'.tap do |result|
            result << " aged #{age}" unless age.nil?
            result << " named #{name}" unless name.nil?
          end
        end
      end
      
      Identify 'a Person' do
        as /a Person aged (\d+)/ do |age|
          Person.new(age.to_i)
        end
        
        as /a Person named (\w+)/ do |name|
          Person.new(nil, name)
        end
      end
      
      Given /<a Person> with blonde hair/ do |person|
        announce "#{person} and I have blonde hair"
      end
      """
    And a file named "features/test.feature" with:
      """
      Feature:
        Scenario:
          Given a Person aged 5 with blonde hair
          And a Person named Dave with blonde hair
      """
    When I successfully run "cucumber"
    Then the output should contain "I am a Person aged 5 and I have blonde hair"
    Then the output should contain "I am a Person named Dave and I have blonde hair"
