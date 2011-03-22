require 'spec_helper'
require 'cucumber/identify/api'

module Cucumber
  describe Identify do
    let(:subject) { Object.new.extend(Identify::Api) }
    let(:runtime) do
      double('Cucumber Runtume', :register_rb_transform => '(?-mix:a friendly Badger)' )
    end
    
    before(:each) do
      subject.runtime = runtime
    end
    
    describe ".expand" do
      before(:each) do
        subject.remember 'badger', lambda {
          phrase /a friendly Badger/ do;end
        }
      end

      context "with a matching identifier" do
        it "expands to include the identifier's regular expression" do
          new_regexp = subject.expand(/<badger> with trousers on/)
          match = new_regexp.match("a friendly Badger with trousers on")
          match.should_not be_nil
        end
      end
    end
  end
end
