Given "I have a form I wish to use with Rails" do |file_content|
  write_file 'my_form.rb', file_content
end

When "I run the active model lint tests for" do |instance|
  write_file 'test_active_model_compliance.rb', <<-TEST
module Rails
end

begin
  # new hotness
  require 'minitest/autorun'
rescue LoadError
  # old and busted then
  require 'test/unit'
end
require '#{ expand_path './my_form' }'

base_class =
  if defined?(::Test)
    Test::Unit::TestCase
  else
    MiniTest::Unit::TestCase
  end

class TestActiveModelCompliance < base_class
  include ActiveModel::Lint::Tests

  def model
  #{ instance }
  end

end
TEST
  run_command 'ruby -Itest test_active_model_compliance.rb'
end

Then "it should pass" do
  expect(all_stdout).to match a_string_including '0 failures'
end
