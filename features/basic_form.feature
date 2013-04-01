Feature: Defining a basic form
  In order to utilise some user input
  As a developer
  I wish to define a basic form to capture input

  @form @basic
  Scenario: Basic Form
    Given I have a form defined as:
      """Ruby
      class MyForm

        DefineField[ self, :event_name, PR::Fields::StringField ]
        DefineField[ self, :start_date, PR::Fields::DateField ]

      end
      """
    When I initialise MyForm
    Then my form should have a string input "event_name"
    And my form should have a date input "start_date"
