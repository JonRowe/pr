require 'pr/fields/invalid_value'
require 'pr/fields/float_field'

describe 'a float field' do
  let(:klass)   { PR::Fields::FloatField }
  let(:value)   { double "value" }
  let(:options) { Hash.new }
  let(:field)   { klass.new value, options }

  describe "default value" do
    specify { expect(klass.new.raw).to eq '' }
    specify { expect(klass.new.options).to eq({}) }
  end

  describe '#options' do
    it 'has retrievable options' do
      expect(field.options).to eq options
    end
  end

  describe "#raw" do
    it 'returns the raw value' do
      expect(field.raw).to eq value
    end
  end

  describe "#populate" do
    let(:value) { 3.141 }
    let(:field) { klass.new }

    subject { field.populate value }

    specify { subject; expect(field.raw).to eq("3.141") }
  end

  describe "#convert" do

    context "where passed a stringified float value" do
      let(:value) { "3.4" }

      it "should return the float intepretation" do
        expect(field.convert).to eq(3.4)
      end
    end

    context "where passed a string not containing a float value" do
      let(:value) { "One Point Oh" }

      specify { expect { field.convert }.to raise_error PR::Fields::InvalidValue }
    end
  end
end
