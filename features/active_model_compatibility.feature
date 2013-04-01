Feature: Active Model compatibility
  In order to use forms with Rails
  As a developer
  I wish to use forms based on PR::Form that also comply with ActiveModel::Lint

  @form @active-model
  Scenario: Basic Active Model functionality
    Given I have a form I wish to use with Rails
      """Ruby
      require 'pr'
      class MyForm
        include PR::ActiveForm
      end
      """
    When I run the active model lint tests for
      """Ruby
        MyForm.new
      """
    Then it should pass
