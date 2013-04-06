Feature: Building a form from a hash
  In order to turn user input into a validated set
  As a developer
  I wish to use a defined form to parse user input from a hash

  @form @basic @hash
  Scenario: Basic Form
    Given I have a form defined as:
      """Ruby
        class MyForm
          include PR::Form

          field :event_name, :string
          field :start_date, :date

        end
      """
    And I have a hash:
      """Ruby
        {
          "event_name" => "Mien Event",
          "start_date" => "31/03/2013"
        }
      """
    When I build my form from the hash:
      """Ruby
        @form = MyForm.new
        PR::BuildFromHash[ @form, @hash ]
      """
    Then my form should have a event_name of "Mien Event"
    Then my form should have a start_date of "31/03/2013"
