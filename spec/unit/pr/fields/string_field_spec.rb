require 'pr/fields/string_field'

describe 'a string field' do
  let(:klass) { PR::Fields::StringField }
  let(:value) { double "value" }
  let(:field) { klass.new value }

  describe "default value" do
    subject { klass.new }

    its(:raw)     { should == '' }
    its(:convert) { should == '' }
  end

  describe "#populate" do
    subject { field.populate value }
    specify { field.raw.should == value }
  end

  describe :raw do
    it "should return the value the field was initialized with" do
      field.raw.should == value
    end
  end

  describe :convert do
    it "should return the string version of value" do
      value.should_receive(:to_s).and_return "string value"
      field.convert.should == "string value"
    end
  end
end
