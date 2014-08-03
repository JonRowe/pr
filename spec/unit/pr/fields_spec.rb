require 'pr/fields'

describe 'accessing fields' do

  let(:lookup) { PR::Fields }

  describe 'finding fields via constant' do
    specify { expect(lookup[:generic]).to eq PR::Fields::GenericField }
    specify { expect(lookup[:string]).to eq PR::Fields::StringField }
    specify { expect(lookup[:boolean]).to eq PR::Fields::BooleanField }
    specify { expect(lookup[:date]).to eq PR::Fields::DateField }
    specify { expect(lookup[:float]).to eq PR::Fields::FloatField }
  end

  describe 'extending with custom fields' do
    let(:my_custom_field) { double "my custom field" }

    it 'allows extension with a custom field' do
      lookup[:custom] = my_custom_field
      expect(lookup[:custom]).to eq my_custom_field
    end
  end

end
