# Generated via
#  `rails generate hyrax:work Image`
class ImageIndexer < Hyrax::WorkIndexer
  # This indexes the default metadata. You can remove it if you want to
  # provide your own metadata and indexing.
  include Hyrax::IndexesBasicMetadata

  # Fetch remote labels for based_near. You can remove this if you don't want
  # this behavior
  include Hyrax::IndexesLinkedMetadata

  def generate_solr_document
    super.tap do |solr_doc|
      solr_doc['year_ssim'] = object.year
      if object.foobar == ['foo']
        solr_doc['foobar_ssim'] = ['bar']
      elsif object.foobar == ['bar']
        solr_doc['foobar_ssim'] = ['foo']
      else
        solr_doc['foobar_ssim'] = ['foobar']
      end
    end
  end
end
