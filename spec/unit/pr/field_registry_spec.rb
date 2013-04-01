require 'pr/field_registry'

describe 'field registry' do
  let(:registry) { PR::FieldRegistry }

  #values
  let(:klass) { double "form klass" }

  describe '.[]' do
    it 'returns a field registry for the klass' do
      expect(registry[klass]).to be_a registry
      expect(registry[klass].for).to eq klass
    end
    it 'returns the same field registry multiple times' do
      expect(registry[klass]).to eq registry[klass]
    end
  end

  describe '#initialize' do
    it 'stores the klass for retrieval' do
      expect(registry.new(klass).for).to eq klass
    end
  end
end
