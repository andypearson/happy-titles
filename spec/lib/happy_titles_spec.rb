describe HappyTitles do
  subject { described_class }

  describe '.config' do
    it 'returns a config object' do
      expect(subject.config).to be_a(subject::Config)
    end

    it 'always returns the same config object' do
      expect(subject.config).to equal(subject.config)
    end
  end

  describe ".configure" do
    it "yields the config object" do
      expect { |b| subject.configure(&b) }.to yield_with_args(subject.config)
    end
  end
end
