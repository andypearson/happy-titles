describe HappyTitles::Template do
  subject { described_class.new(:my_template) }

  it "has a name" do
    expect(subject.name).to eq(:my_template)
  end
end
