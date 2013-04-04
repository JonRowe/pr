Given "I have a model defined as:" do |code|
  define_model code
end

When "I build my model from the form:" do |code|
  run_test code
end

Then /^my model should have a string for (\w+) "(\w+)"$/ do |field_name,field_data|
  access("@model").send(field_name).should == field_data
end

Then /^my model should have a date for ([^\s]+) `(.*)`$/ do |field_name,field_data|
  access("@model").send(field_name).should == eval(field_data)
end
