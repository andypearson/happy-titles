describe "HappyTitle Helpers" do
  let(:view) { ActionView::Base.new }
  let(:page_title) { view.page_title }

  before do
    HappyTitles.configure do |config|
      config.site = "Custom site"
      config.tagline = "Custom tagline"
    end
  end

  it "renders the page title" do
    expect(page_title).to eq("<title>Custom site | Custom tagline</title>")
  end

  context "when the title is set" do
    before do
      view.title "Custom title"
    end

    it "returns the title" do
      expect(view.title).to eq("Custom title")
    end

    it "renders the page title" do
      expect(page_title).to eq("<title>Custom title | Custom site</title>")
    end

    context "setting the title again" do
      before do
        view.title "Another title"
      end

      it "should overwrite the previously set title" do
        expect(view.title).to eq("Another title")
      end
    end
  end

  context "when the title contains special entities" do
    before do
      view.title "This & That"
    end

    it "should escape special entities" do
      expect(page_title).to eq("<title>This &amp; That | Custom site</title>")
    end
  end

  context "when there is a custom template" do
    let(:page_title) { view.page_title(:custom) }

    before do
      HappyTitles.configure do |config|
        config.templates do
          custom "++ :site ++", "++ :site ++ :title ++"
        end
      end
    end

    it "renders the page title" do
      expect(page_title).to eq("<title>++ Custom site ++</title>")
    end

    context "when the title is set" do
      before do
        view.title "Custom title"
      end

      it "renders the page title" do
        expect(page_title).to eq("<title>++ Custom site ++ Custom title ++</title>")
      end
    end
  end
end
