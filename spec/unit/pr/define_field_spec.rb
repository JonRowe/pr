require 'pr/fields/generic_field'
require 'pr/define_field'

describe 'defining a field on a form' do
  let(:field)         { PR::Fields::GenericField }
  let(:form_klass)    { Class.new }
  let(:form)          { form_klass.new }
  let(:new_raw_value) { double "new raw field value" }
  let(:define_field)  { DefineField.new }

  it 'defines a reader to return the raw value of the field' do
    define_field.on form_klass, :name, field
    expect(form.name).to eq field.new.raw
  end
  it 'defines a writer which will set the field value' do
    define_field.on form_klass, :name, field
    form.name = new_raw_value
    expect(form.name).to eq new_raw_value
  end
end
