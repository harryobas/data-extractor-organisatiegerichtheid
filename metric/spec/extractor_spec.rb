
require 'spec_helper'

RSpec.describe  Metric::Extractor do
  context "initialization" do
    it 'initializes with a file path' do
      file = File.expand_path("spec/fixtures/candidate_0a0cc1_test_results.json")
      expect(Metric::Extractor.new(file)).not_to eq nil
    end
  end
  describe "#extract_metric" do
    context "with valid file path" do
      it "returns an organisatiegerichtheid metric " do
        file = File.expand_path("spec/fixtures/candidate_0a0cc1_test_results.json")
        extractor = Metric::Extractor.new(file)
        expect(extractor.extract_metric).to be_a(Metric::Organisatiegerichtheid)
      end
    end
    context "with invalid file path" do
      it "returns nil" do
        file = File.expand_path("spec/fixtures/results.json")
        extractor = Metric::Extractor.new(file)
        expect(extractor.extract_metric).to eq nil
      end
    end
    context "file content is not a json structured string" do
      it "returns nil" do
        file = File.expand_path("spec/fixtures/non-json.rtf")
        extractor = Metric::Extractor.new(file)
        expect(extractor.extract_metric).to eq nil
      end

    end
  end

end
