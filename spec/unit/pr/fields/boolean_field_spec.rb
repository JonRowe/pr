require 'pr/fields/boolean_field'

describe 'a boolean field' do
  let(:klass)   { PR::Fields::BooleanField }
  let(:value)   { double "value" }
  let(:options) { Hash.new }
  let(:field)   { klass.new value, options }

  describe "default value" do
    subject { klass.new }

    specify { expect(subject.raw).to equal(false) }
    specify { expect(subject.convert).to equal(false) }
    specify { expect(subject.options).to eq({}) }
  end

  describe '#options' do
    it 'has retrievable options' do
      expect(field.options).to eq options
    end
  end

  describe :raw do
    let(:converted_value) { double "converted_value" }

    it "should return the converted value" do
      expect(field).to receive(:convert).and_return(converted_value)
      expect(field.raw).to eq(converted_value)
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
