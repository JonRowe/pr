Feature: Building a form from an existing models
  In order to apply user input to an existing model
  As a developer
  I wish to use a defined form to display existing data

  @form @basic @model
  Scenario: Basic Form
    Given I have a form defined as:
      """Ruby
        class MyForm
          include PR::Form

          field :event_name, :string
          field :start_date, :date

        end
      """
    And I have a model defined as:
      """Ruby
        @model = Struct.new(:event_name,:start_date).new 'An Event', Date.civil(2013,2,28)
      """
    When I build my form from a model:
      """Ruby
        @form = PR::BuildFromModel[ MyForm, @model ]
      """
    Then my form should have a event_name of "An Event"
    Then my form should have a start_date of "28/02/2013"

  @form @macro @model
  Scenario: Basic Form built using macro
    Given I have a form defined as:
      """Ruby
        class MyForm
          include PR::Form

          field :event_name, :string
          field :start_date, :date

        end
      """
    And I have a model defined as:
      """Ruby
        @model = Struct.new(:event_name,:start_date).new 'An Event', Date.civil(2013,2,28)
      """
    When I build my form using the macro:
      """Ruby
        @form = MyForm.from_model @model
      """
    Then my form should have a event_name of "An Event"
    Then my form should have a start_date of "28/02/2013"
