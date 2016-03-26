describe "HappyTitle Helpers" do
  let(:view) { ActionView::Base.new }
  let(:page_title) { view.page_title }

  before do
    HappyTitles.configure do |config|
      config.site = "My site"
      config.tagline = "My tagline"
    end
  end

  it "renders the page title" do
    expect(page_title).to eq("<title>My site | My tagline</title>")
  end

  context "when the title is set" do
    before do
      view.title "My title"
    end

    it "returns the title" do
      expect(view.title).to eq("My title")
    end

    it "renders the page title" do
      expect(page_title).to eq("<title>My title | My site</title>")
    end
  end
end
