Given "I have a form I wish to use with Rails" do |file_content|
  write_file 'my_form.rb', file_content
end

When "I run the active model lint tests for" do |instance|
  write_file 'test_active_model_compliance.rb', <<-TEST
module Rails
end

require 'test/unit'
require '#{ File.expand_path "../../../" + dirs.join('/'), __FILE__ }/my_form'

class TestActiveModelCompliance < Test::Unit::TestCase
  include ActiveModel::Lint::Tests

  def model
  #{ instance }
  end

end
TEST
  run_simple unescape 'ruby -Itest test_active_model_compliance.rb'
end

Then "it should pass" do
  assert_partial_output '0 failures', all_output
end
