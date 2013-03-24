require 'pr/fields/invalid_value'
require 'pr/fields/date_field'

describe 'a date field' do
  let(:klass) { PR::Fields::DateField }
  let(:value) { double "value" }
  let(:field) { klass.new value }

  describe "default value" do
    subject { klass.new }

    its(:raw) { should == '' }
    specify   { expect { subject.convert }.to raise_error PR::Fields::InvalidValue }
  end

  describe "raw" do
    it "returns the value the field was initialized with" do
      field.raw.should == value
    end
  end

  describe "#populate" do
    let(:value) { Date.civil 2011, 6, 1 }

    subject { field.populate value }
    specify { subject; field.raw.should == '01/06/2011' }
  end

  describe "convert" do

    it "should attempt to parse the value as a uk formatted date" do
      Date.should_receive(:strptime).with(value,'%d/%m/%Y')
      field.convert
    end

    context "where value is not a valid date" do
      it "should raise an InvalidFieldValueError" do
        Date.should_receive(:strptime).and_raise(ArgumentError)
        expect { field.convert }.to raise_error PR::Fields::InvalidValue
      end
    end
  end

end
