Given /^the following tokens$/ do |table|
  values = table.hashes[0]
  @name = values[:name]
  @language = values[:language]
end


When /^I template "([^\"]*)"$/ do |string|
  string.extend(StringTemplater)
  @template_string = string.replace_tokens(string, :name => @name, :language => @language)
end

Then /^I should get "([^\"]*)"$/ do |expected_string|
  @template_string.should == expected_string
end

