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

  describe 'registeration' do
    let(:name)  { double "field name" }
    let(:field) { double "field" }

    let(:specific_register) { registry.new klass }

    it 'stores the field on the register' do
      specific_register.register name, field
    end

    it 'allows retreival of that field' do
      specific_register.register name, field
      expect(specific_register.fetch name).to eq field
    end

    it 'enumerates fields' do
      specific_register.register name, field
      expect(specific_register.fields).to eq [name]
    end
  end
end
