Given "I have a field defined as:" do |code|
  define_field code
end

When "I register the field:" do |code|
  run_test code
end
