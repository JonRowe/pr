require 'pr/fields/generic_field'

describe 'a generic field' do
  let(:klass)   { PR::Fields::GenericField }
  let(:value)   { double "value" }
  let(:options) { Hash.new }
  let(:field)   { klass.new value, options }

  describe "default value" do
    specify { expect(klass.new.raw).to eq nil }
    specify { expect(klass.new.convert).to eq nil }
    specify { expect(klass.new.options).to eq({}) }
  end

  describe '#options' do
    it 'has retrievable options' do
      expect(field.options).to eq options
    end
  end

  describe :raw do
    it "should return the value the field was initialized with" do
      expect(field.raw).to eq(value)
    end
  end

  describe "#populate" do
    subject { field.populate value }
    specify { expect(field.raw).to eq(value) }
  end

  describe :convert do
    it "should return the raw value" do
      expect(field.convert).to eq(value)
    end
  end
end
