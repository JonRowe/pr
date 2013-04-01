require 'pr/form'

describe 'the PR Form' do
  let(:form_klass) do
    Class.new do
      include PR::Form
    end
  end

  describe 'when included extends the other with its DSL' do
    let(:name) { double "field name" }
    let(:type) { double "field type" }

    before do
      stub_const 'DefineAndRegister', double
    end

    it 'sets up field to define fields' do
      DefineAndRegister.should_receive(:[]).with form_klass, name, type, {}
      form_klass.field name, type
    end
    it 'sets up field to define fields and passes in options' do
      DefineAndRegister.should_receive(:[]).with form_klass, name, type, my: :option
      form_klass.field name, type, my: :option
    end
  end
end
