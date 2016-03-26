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
      expect(subject.template).to be_a(HappyTitles::Template)
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

  # describe "#templates" do
  #   let(:render) { subject.template(template).render(**options) }
  #
  #   let(:title) { nil }
  #   let(:options) do
  #     {
  #       title: title,
  #       site: "Site",
  #       tagline: "Tagline"
  #     }
  #   end
  #
  #   describe "Adding a template" do
  #     let(:template) { :custom_template }
  #
  #     before do
  #       subject.templates do
  #         custom_template "without_title", "with_title"
  #       end
  #     end
  #
  #     it "renders without a title" do
  #       expect(render).to eq("without_title")
  #     end
  #
  #     context "when the title is set" do
  #       let(:title) { "A title" }
  #
  #       it "renders with a title" do
  #         expect(render).to eq("with_title")
  #       end
  #     end
  #   end
  #
  #   describe "Adding a template without a with_title template" do
  #     let(:template) { :simple_template }
  #
  #     before do
  #       subject.templates do
  #         simple_template "without_title"
  #       end
  #     end
  #
  #     it "renders without a title" do
  #       expect(render).to eq("without_title")
  #     end
  #
  #     context "when the title is set" do
  #       let(:title) { "A title" }
  #
  #       it "renders with a title" do
  #         expect(render).to eq("without_title")
  #       end
  #     end
  #   end
  #
  #   describe "Changing the default template" do
  #     let(:template) { :default }
  #
  #     before do
  #       subject.templates do
  #         default "without_title", "with_title"
  #       end
  #     end
  #
  #     it "renders without a title" do
  #       expect(render).to eq("without_title")
  #     end
  #
  #     context "when the title is set" do
  #       let(:title) { "A title" }
  #
  #       it "renders with a title" do
  #         expect(render).to eq("with_title")
  #       end
  #     end
  #   end
  # end
end
