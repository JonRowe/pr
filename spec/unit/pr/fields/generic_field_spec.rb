require 'pr/fields/generic_field'

describe 'a generic field' do
  let(:klass) { PR::Fields::GenericField }
  let(:value) { double "value" }
  let(:field) { klass.new value }

  describe "default value" do
    subject { klass.new }

    its(:raw)     { should == nil }
    its(:convert) { should == nil }
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
