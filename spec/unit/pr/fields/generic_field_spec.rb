require 'pr/fields/generic_field'

describe 'a generic field' do
  let(:klass)   { PR::Fields::GenericField }
  let(:value)   { double "value" }
  let(:options) { Hash.new }
  let(:field)   { klass.new value, options }

  describe "default value" do
    subject { klass.new }

    its(:raw)     { should == nil }
    its(:convert) { should == nil }
    its(:options) { should == {} }
  end

  describe '#options' do
    it 'has retrievable options' do
      expect(field.options).to eq options
    end
  end

  describe :raw do
    it "should return the value the field was initialized with" do
      field.raw.should == value
    end
  end

  describe "#populate" do
    subject { field.populate value }
    specify { field.raw.should == value }
  end

  describe :convert do
    it "should return the raw value" do
      field.convert.should == value
    end
  end
end
