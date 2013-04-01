require 'pr/fields'

describe 'accessing fields' do

  let(:lookup) { PR::Fields }

  describe 'finding fields via constant' do
    subject { lookup }

    its([:generic]) { should eq PR::Fields::GenericField }
    its([:string])  { should eq PR::Fields::StringField }
    its([:boolean]) { should eq PR::Fields::BooleanField }
    its([:date])    { should eq PR::Fields::DateField }
    its([:float])   { should eq PR::Fields::FloatField }
  end

  describe 'extending with custom fields' do
    let(:my_custom_field) { double "my custom field" }

    it 'allows extension with a custom field' do
      lookup[:custom] = my_custom_field
      expect(lookup[:custom]).to eq my_custom_field
    end
  end

end
