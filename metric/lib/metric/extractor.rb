require 'json'

require 'metric/organisatiegerichtheid'

module Metric
  class Extractor
    attr_reader :file
    def initialize(file)
      @file = file
    end

    def extract_metric
      begin
        json = File.read(file)
        data = JSON.parse.(json)
        get_organisatiegerichtheid(data)
      rescue Errno::ENOENT => e
        nil
      end
    end

    private

    def get_organisatiegerichtheid(data)
      extracted_data = data["competenties"]["organisatiegerichtheid"]
      metric = Metric::Organisatiegerichtheid.new
      metric.organisatiesensitiviteit = extracted_data["organisatiesensitiviteit"]
      metric.klantorientatie = extracted_data["klantorientatie"]
      metric.kwaliteitsgerichtheid = extracted_data["kwaliteitsgerichtheid"]
      metric.ondernemerschap = extracted_data["ondernemerschap"]
      return metric
    end
  end
end
