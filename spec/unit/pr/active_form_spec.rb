require 'pr/active_form'

describe 'the PR Form' do
  class TestForm
    include PR::ActiveForm
  end
  let(:form_klass) { TestForm }

  describe 'when included extends the other with its DSL' do
    let(:name) { double "field name" }
    let(:type) { double "field type" }

    before do
      stub_const 'PR::DefineAndRegister', double
    end

    it 'sets up field to define fields' do
      PR::DefineAndRegister.should_receive(:[]).with form_klass, name, type, {}
      form_klass.field name, type
    end
    it 'sets up field to define fields and passes in options' do
      PR::DefineAndRegister.should_receive(:[]).with form_klass, name, type, my: :option
      form_klass.field name, type, my: :option
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

      its(:to_model) { should eq form }
      its(:to_partial_path) { should eq 'testforms/testform' }

      describe 'when not persisted' do

        its(:persisted?) { should be_false }
        its(:to_key)     { should be_nil }
        its(:to_param)   { should be_nil }
      end

      describe 'when persisted' do
        before do
          form.id = 100
        end

        its(:persisted?) { should be_true  }
        its(:to_key)     { should eq [:id] }
        its(:to_param)   { should == "100" }
      end
    end

    describe 'and responds to ActiveModel errors' do
      let(:errors) { double }
      let(:form)   { form_klass.new }
      before { ActiveModel::Errors.stub(:new).and_return(errors) }

      subject { form.errors }

      it 'creates active model errors with itself' do
        ActiveModel::Errors.should_receive(:new).with form
        form.errors
      end
      it 'returns the errors object' do
        expect(form.errors).to eq errors
      end
    end

  end
end
