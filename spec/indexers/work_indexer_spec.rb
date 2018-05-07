require 'rails_helper'

RSpec.describe WorkIndexer do
  subject { described_class.new(work) }
  let(:work) { Work.new(year: ['2018']) }
  describe '#generate_solr_document' do
    it 'indexes the year' do
      expect(subject.generate_solr_document).to include('year_ssim' => ['2018'])
    end
  end
end
