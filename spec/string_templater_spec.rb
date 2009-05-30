require File.dirname(__FILE__) + '/spec_helper.rb'

describe StringTemplater do
  def tokenize(string, context = {})
    string.extend(StringTemplater).tokenize(context)
  end
  context "with no tokens" do
    it "returns blank string if string is blank" do
      tokenize("").should == ""
    end
    it "returns string unchanged" do
      tokenize("hello, world").should == "hello, world"
    end
  end
  context "with one token" do
    it "replaces token with empty string if no value in context" do
      tokenize("$name").should == ""
    end
    it "replaces token with value from context" do
      tokenize("$name", :name => 'corey').should == 'corey'
    end
    it "leaves rest of string unchanged" do
      tokenize("my name is $name", :name => 'corey').should == 'my name is corey'
    end
  end
  context "with two tokens" do
    it "replaces each token with the value from the context" do
      tokenize("$name loves $food", :name => 'corey', :food => 'bacon').should ==
                "corey loves bacon"
    end
    it "replaces with blank string the tokens that have no value in context" do
      tokenize("$name loves $food1 and $food2", :name => 'corey').should ==
                "corey loves  and "
    end
  end
end
