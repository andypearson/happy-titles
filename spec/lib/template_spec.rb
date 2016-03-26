describe HappyTitles::Template do
  subject do
    described_class.new(
      name: :my_template,
      with_title: ":title | :site",
      without_title: ":site | :tagline"
    )
  end

  it "has a name" do
    expect(subject.name).to eq(:my_template)
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
  end
end
