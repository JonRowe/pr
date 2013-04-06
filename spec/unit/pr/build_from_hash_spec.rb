require 'pr/build_from_hash'

describe 'building a form from a hash' do
  let(:form) { Struct.new(:a,:b).new }
  let(:hash) { { "a" => "a", "b" => "b" } }

  let(:builder)  { PR::BuildFromHash.new form }

  it 'sets hash values on form' do
    builder.from hash
    expect(form.a).to eq "a"
    expect(form.b).to eq "b"
  end
end
