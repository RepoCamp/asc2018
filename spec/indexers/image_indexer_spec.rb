require 'rails_helper'

RSpec.describe ImageIndexer do
  subject { described_class.new(image) }
  let(:image) { Image.new(year: ['2018']) }
  describe '#generate_solr_document' do
    it 'indexes the year' do
      expect(subject.generate_solr_document).to include('year_ssim' => ['2018'])
    end
    context 'when foobar is set to foo' do
      let(:image) { Image.new(year: ['2018'], foobar: ['foo']) }
      it 'indexes bar' do
        expect(subject.generate_solr_document).to include('foobar_ssim' => ['bar'])
      end
    end
    context 'when foobar is set to bar' do
      let(:image) { Image.new(year: ['2018'], foobar: ['bar']) }
      it 'indexes foo' do
        expect(subject.generate_solr_document).to include('foobar_ssim' => ['foo'])
      end
    end
    context 'when foobar is set to anything else' do
      let(:image) { Image.new(year: ['2018'], foobar: ['anything else']) }
      it 'indexes foobar' do
        expect(subject.generate_solr_document).to include('foobar_ssim' => ['foobar'])
      end
    end
  end
end
