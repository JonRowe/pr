require 'pr/fields/boolean_field'

describe 'a boolean field' do
  let(:klass) { PR::Fields::BooleanField }
  let(:value) { double "value" }
  let(:field) { klass.new value }

  describe "default value" do
    subject { klass.new }

    its(:raw)     { should equal(false) }
    its(:convert) { should equal(false) }
  end

  describe :raw do
    let(:converted_value) { double "converted_value" }

    it "should return the converted value" do
      field.should_receive(:convert).and_return(converted_value)
      field.raw.should == converted_value
    end
  end

  describe "#populate" do
    specify { field.populate(true);  expect(field.raw).to equal true }
    specify { field.populate(false); expect(field.raw).to equal false }
  end

  describe :convert do
    let(:comparison_result) { double "true" }

    context "true values" do
      specify { expect( klass.new("1").convert    ).to equal true }
      specify { expect( klass.new(1).convert      ).to equal true }
      specify { expect( klass.new("true").convert ).to equal true }
      specify { expect( klass.new(true).convert   ).to equal true }
      specify { expect( klass.new("something that will evaluate to true").convert ).to equal true }
    end

    context "false values" do
      specify { expect( klass.new("0").convert     ).to equal false }
      specify { expect( klass.new(0).convert       ).to equal false }
      specify { expect( klass.new("false").convert ).to equal false }
      specify { expect( klass.new(false).convert   ).to equal false }
      specify { expect( klass.new(nil).convert     ).to equal false }
      specify { expect( klass.new("").convert      ).to equal false }
    end
  end
end
