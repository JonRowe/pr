require 'pr/form'

describe 'the PR Form' do
  let(:form_klass) do
    Class.new do
      include PR::Form
    end
  end

  describe 'when included extends the other with its DSL' do
    it 'sets up field to define fields' do
      stub_const 'DefineAndRegister', double
      DefineAndRegister.should_receive(:[]).with form_klass, :name, my: :options
      form_klass.field :name, my: :options
    end
  end
end
