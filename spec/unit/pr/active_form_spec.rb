require 'pr/active_form'

describe 'the PR Form' do
  class TestForm
    include ActiveForm
  end
  let(:form_klass) { TestForm }

  describe 'when included extends the other with its DSL' do

    it 'sets up field to define fields' do
      stub_const 'DefineAndRegister', double
      DefineAndRegister.should_receive(:[]).with form_klass, :name, my: :options
      form_klass.field :name, my: :options
    end

    it 'sets up an id' do
      form = form_klass.new
      form.id = :my_id
      expect(form.id).to eq :my_id
    end

    describe 'and makes the form ActiveModel compliant' do
      let(:form) { form_klass.new }
      subject    { form }

      it { should respond_to :id }
      it { should respond_to :valid? }
      it { should respond_to :errors }

      it 'has a model name' do
        expect(form_klass.model_name).to eq "TestForm"
        expect(form_klass.model_name).to be_a ActiveModel::Name
      end
    end

  end
end
