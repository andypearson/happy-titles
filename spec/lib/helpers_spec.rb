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
  end
end
