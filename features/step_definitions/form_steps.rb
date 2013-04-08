Given "I have a form defined as:" do |code|
  define_form code
end

Given "I have preloaded the form with data:" do |code|
  run_test code
end

When "I build my form from a model:" do |code|
  run_test code
end

When /^I initialise (\w+)$/ do |klass|
  @form = fetch(klass).new
end

Then /^my form should have a string input "(\w+)"$/ do |name|
  set @form, name, "my demo string"
end

Then /^my form should have a date input "(\w+)"$/ do |name|
  set @form, name, "31/03/2013"
end
