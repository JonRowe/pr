require 'pr/define_and_register'

describe 'defining and registering fields' do

  #values
  let(:form_klass)  { double "form klass" }
  let(:field_name)  { double "field name" }
  let(:field_type)  { double "field type" }
  let(:field_klass) { double "field klass" }
  let(:registry)    { double "registry", register: true }
  let(:field)       { double "field" }
  let(:options)     { Hash.new }

  #services
  let(:field_registry)   { double "registry",   :[] => registry }
  let(:field_lookup)     { double "fields",     :[] => field_klass }
  let(:field_definition) { double "definition", :[] => field }

  before do
    stub_const 'PR::FieldRegistry', field_registry
    stub_const 'PR::Fields',        field_lookup
    stub_const 'PR::DefineField',   field_definition
  end

  describe 'using the macro' do
    it 'looks up the field registry for this form klass' do
      expect(PR::FieldRegistry).to receive(:[]).with(form_klass).and_return(registry)
      PR::DefineAndRegister[ form_klass, field_name, field_type ]
    end

    it 'looks up the the field for this type' do
      expect(PR::Fields).to receive(:[]).with(field_type)
      PR::DefineAndRegister[ form_klass, field_name, field_type ]
    end

    it 'defines a field on this form klass' do
      expect(PR::DefineField).to receive(:[]).with( form_klass, field_name, field_klass, {} )
      PR::DefineAndRegister[ form_klass, field_name, field_type ]
    end

    it 'registers this definition' do
      expect(registry).to receive(:register).with(field_name,field)
      PR::DefineAndRegister[ form_klass, field_name, field_type ]
    end

    context 'with options' do
      it 'defines a field on this form klass' do
        expect(PR::DefineField).to receive(:[]).with( form_klass, field_name, field_klass, options )
        PR::DefineAndRegister[ form_klass, field_name, field_type, options ]
      end
    end
  end

  describe 'registering field' do
    let(:definition) { PR::DefineAndRegister.new form_klass }

    it 'looks up the field registry for this form klass' do
      expect(PR::FieldRegistry).to receive(:[]).with(form_klass).and_return(registry)
      definition.register field_name, field
    end

    it 'registers this definition' do
      expect(registry).to receive(:register).with(field_name,field)
      definition.register field_name, field
    end
  end

  describe 'defining field' do
    let(:definition) { PR::DefineAndRegister.new form_klass }

    it 'looks up the field registry for this form klass' do
      expect(PR::FieldRegistry).to receive(:[]).with(form_klass).and_return(registry)
      definition.define field_name, field_type
    end

    it 'looks up the the field for this type' do
      expect(PR::Fields).to receive(:[]).with(field_type)
      definition.define field_name, field_type
    end

    it 'defines a field on this form klass' do
      expect(PR::DefineField).to receive(:[]).with( form_klass, field_name, field_klass, {} )
      definition.define field_name, field_type
    end

    context 'with options' do
      it 'defines a field on this form klass' do
        expect(PR::DefineField).to receive(:[]).with( form_klass, field_name, field_klass, options )
        definition.define field_name, field_type, options
      end
    end
  end
end
