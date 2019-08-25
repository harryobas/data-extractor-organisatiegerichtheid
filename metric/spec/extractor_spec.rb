RSpec.describe  Metric::Extractor do
  context "initialization" do
    it 'initializes with a valid json file' do
      file = "./fixtures/candidate_0a0cc1_test_results.json"
      expect(Metric::Extractor.new(file)).not_to eq nil
    end
    #it 'raises error when file is not a valid json'
  end

end
