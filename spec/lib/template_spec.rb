# frozen_string_literal: true
describe HappyTitles::Template do
  subject do
    described_class.new(
      name: name,
      with_title: with_title,
      without_title: without_title
    )
  end

  let(:name) { :my_template }
  let(:with_title) { ":title | :site" }
  let(:without_title) { ":site | :tagline" }

  it "has a name" do
    expect(subject.name).to eq(:my_template)
  end

  context "When name is a string" do
    let(:name) { "my_template" }

    it "changes the name to a symbol" do
      expect(subject.name).to eq(:my_template)
    end
  end

  describe "Rendering the template" do
    let(:render) { subject.render(**options) }

    let(:title) { nil }
    let(:options) do
      {
        title: title,
        site: "My site",
        tagline: "My tagline"
      }
    end

    it "renders without a title" do
      expect(render).to eq("My site | My tagline")
    end

    context "When the title is set" do
      let(:title) { "My title" }

      it "renders with a title" do
        expect(render).to eq("My title | My site")
      end
    end

    context "when the template only has a single format" do
      let(:with_title) { nil }
      let(:without_title) { ":site (:title)" }

      it "renders with a title" do
        expect(render).to eq("My site (My tagline)")
      end

      context "When the title is set" do
        let(:title) { "My title" }

        it "renders with a title" do
          expect(render).to eq("My site (My title)")
        end
      end
    end
  end
end
