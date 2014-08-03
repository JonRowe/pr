require 'pr/build_from_model'

describe 'building forms from models' do

  let(:registry) { double "field registry", fields: [:a,:b] }
  let(:form)     { double "form", __a: field_a, __b: field_b }
  let(:field_a)  { double "field a", populate: nil }
  let(:field_b)  { double "field b" }
  let(:model)    { Struct.new(:a).new 'a' }

  let(:builder)    { PR::BuildFromModel.new(registry, form) }

  it 'gets fields from the registry' do
    expect(registry).to receive(:fields)
    builder.build_from model
  end

  it 'populates the form values from the model when it has them' do
    expect(field_a).to receive(:populate).with('a')
    builder.build_from model
  end

  it 'returns the form' do
    expect( builder.build_from model ).to eq form
  end

end
