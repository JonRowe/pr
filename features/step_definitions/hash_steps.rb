Given "I have a hash:" do |code|
  define_hash code
end

Given "I build my form using the macro:" do |code|
  run_test code
end

When "I build my form from the hash:" do |code|
  run_test code
end

Then /^my form should have a ([\w_]+) of "(.*)"$/ do |field_name,field_data|
  access("@form").send(field_name).should == field_data
end
