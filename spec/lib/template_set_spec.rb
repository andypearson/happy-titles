# frozen_string_literal: true
describe HappyTitles::TemplateSet do
  subject do
    described_class.new(template)
  end

  let(:template) { instance_double(HappyTitles::Template, name: :custom) }

  describe "#get" do
    it "gets the template" do
      expect(subject.get(:custom)).to eq(template)
    end

    it "converts string arguments to a symbol" do
      expect(subject.get("custom")).to eq(template)
    end

    it "raises an error if a template cannot be found" do
      expect { subject.get(:unknown) }.to raise_error(
        HappyTitles::TemplateNotFound,
        'A template called "unknown" could not be found. Templates that exist are: custom'
      )
    end
  end

  describe "Adding a new template" do
    let(:new_template) { subject.get(:additional) }

    before do
      subject.additional("without_title", "with_title")
    end

    it "adds a template" do
      expect(new_template).to be_a(HappyTitles::Template)
    end

    it "sets the template name" do
      expect(new_template.name).to eq(:additional)
    end
  end

  describe "Adding a template with only one format" do
    let(:new_template) { subject.get(:single_format) }

    before do
      subject.single_format("without_title")
    end

    it "adds a template" do
      expect(new_template).to be_a(HappyTitles::Template)
    end
  end

  describe "Overwriting an existing template" do
    before do
      subject.custom("without_title", "with_title")
    end

    it "overwrites the old template" do
      expect(subject.get(:custom)).not_to eq(template)
    end
  end
end
