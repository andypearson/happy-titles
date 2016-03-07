describe HappyTitles::Config do
  subject { described_class.new }

  it "has a default site" do
    expect(subject.site).to eq("My Site")
  end

  it "has a default tagline" do
    expect(subject.tagline).to eq("My short, descriptive and witty tagline")
  end

  it "has a default template" do
    expect(subject.template).to be_a(HappyTitles::Template)
  end

  describe "Instance methods" do
    describe "#template" do
      it "returns the default template" do
        expect(subject.template.name).to eq(:default)
      end

      it "returns a template based on the key" do
        expect(subject.template(:default).name).to eq(:default)
      end

      it "converts string arguments to a symbol" do
        expect(subject.template("default").name).to eq(:default)
      end

      it "raises an error if a template cannot be found" do
        expect { subject.template(:unknown_key) }.to raise_error(HappyTitles::TemplateNotFound, 'A template called "unknown_key" could not be found. Templates that exist are: default')
      end
    end
  end
end
