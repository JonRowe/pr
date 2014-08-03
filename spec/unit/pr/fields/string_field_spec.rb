require 'pr/fields/string_field'

describe 'a string field' do
  let(:klass)   { PR::Fields::StringField }
  let(:value)   { double "value" }
  let(:options) { Hash.new }
  let(:field)   { klass.new value, options }

  describe "default value" do
    specify { expect(klass.new.raw).to eq '' }
    specify { expect(klass.new.convert).to eq '' }
    specify { expect(klass.new.options).to eq({}) }
  end

  describe '#options' do
    it 'has retrievable options' do
      expect(field.options).to eq options
    end
  end

  describe "#populate" do
    subject { field.populate value }
    specify { expect(field.raw).to eq(value) }
  end

  describe :raw do
    it "should return the value the field was initialized with" do
      expect(field.raw).to eq(value)
    end
  end

  describe :convert do
    it "should return the string version of value" do
      expect(value).to receive(:to_s).and_return "string value"
      expect(field.convert).to eq("string value")
    end
  end
end
