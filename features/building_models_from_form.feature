Feature: Building a model from a form
  In order to turn user input into a model
  As a developer
  I wish to user a defined form to build a model

  @form @basic @build
  Scenario: Basic Form
    Given I have a form defined as:
      """Ruby
        class MyForm
          include PR::Form

          field :event_name, :string
          field :start_date, :date

        end
      """
    And I have preloaded the form with data:
      """Ruby
        @form = MyForm.new
        @form.event_name = 'Event'
        @form.start_date = '31/03/2013'
      """
    And I have a model defined as:
      """Ruby
        class Event < Struct.new(:event_name,:start_date)
        end
      """
    When I build my model from the form:
      """Ruby
        @model = Event.new
        PR::BuildModel[@model,@form]
      """
    Then my model should have a string for event_name "Event"
    And my model should have a date for start_date `Date.civil(2013,3,31)`
