# frozen_string_literal: true
describe HappyTitles::Config do
  subject { described_class.new }

  describe "#site" do
    it "returns the default" do
      expect(subject.site).to eq("My site")
    end

    context "When the default has been changed" do
      before { subject.site = "Custom site" }

      it "returns the new value" do
        expect(subject.site).to eq("Custom site")
      end
    end
  end

  describe "#tagline" do
    it "returns the default" do
      expect(subject.tagline).to eq("My short, descriptive and witty tagline")
    end

    context "When the default has been changed" do
      before { subject.tagline = "Custom tagline" }

      it "returns the new value" do
        expect(subject.tagline).to eq("Custom tagline")
      end
    end
  end

  describe "#template" do
    it "returns the default template" do
      expect(subject.template.name).to eq(:default)
    end

    it "returns a template based on the key" do
      expect(subject.template(:default).name).to eq(:default)
    end
  end
end
