require 'rails_helper'

RSpec.describe Hyrax::WorkPresenter do
  subject(:presenter) { described_class.new(document, ability, request) }
  let(:ability)       { nil }
  let(:document)      { SolrDocument.new(work.to_solr) }
  let(:request)       { nil }
  let(:work)          { Work.new }
end
