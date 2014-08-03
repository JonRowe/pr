require 'pr/build_model'

describe 'building a model from a form' do
  let(:model)    { Struct.new(:a,:b).new }
  let(:registry) { double fields: [:a,:b] }

  let(:field_a)    { double "field", convert: "a_value" }
  let(:field_b)    { double "field", convert: "b_value" }
  let(:form)       { double "form", __a: field_a, __b: field_b }

  let(:builder)  { PR::BuildModel.new registry }

  it 'gets the fields' do
    expect(registry).to receive(:fields)
    builder.for form, model
  end
  it 'converts fields to values' do
    expect(field_a).to receive(:convert)
    expect(field_b).to receive(:convert)
    builder.for form, model
  end
  it 'iterated over the fields and sets values' do
    builder.for form, model
    expect(model.a).to eq "a_value"
    expect(model.b).to eq "b_value"
  end
end
