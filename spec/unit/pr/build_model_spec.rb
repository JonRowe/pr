require 'pr/build_model'

describe 'building a model from a form' do
  let(:model)    { Struct.new(:a,:b).new }
  let(:registry) { double }

  let(:field_a)  { double "field", convert: "a_value" }
  let(:field_b)  { double "field", convert: "b_value" }
  let(:form)     { double "form", __a: field_a, __b: field_b }

  let(:builder)  { BuildModel.new registry }

  before do
    registry.stub(:fields_for).and_yield(:a).and_yield(:b)
  end

  it 'fetches fields from the registry' do
    registry.should_receive(:fields_for).with(form)
    builder.for form, model
  end
  it 'converts fields to values' do
    field_a.should_receive(:convert)
    field_b.should_receive(:convert)
    builder.for form, model
  end
  it 'iterated over the fields and sets values' do
    builder.for form, model
    expect(model.a).to eq "a_value"
    expect(model.b).to eq "b_value"
  end
end
