Feature: Defining custom fields
  In order to extend the gem with customised fields
  As a developer
  I wish to define and register custom fields

  @custom @fields
  Scenario: Defining and using a custom field
    Given I have a field defined as:
      """Ruby
      class MyCustomField

        def initialize value = nil, options = {}
          @value, @options = value, options
        end
        attr_reader :options

        def raw
          @value
        end

        def populate value
          @value = value
        end

        def convert
          @value
        end

      end
      """
    When I register the field:
      """Ruby
      PR::Fields[:custom] = MyCustomField
      """
    Then I should be able define a form as:
      """Ruby
        class MyCustomFieldForm
          include PR::Form
          field :example, :custom
        end
      """
    And my form should have a `MyCustomField` example field
