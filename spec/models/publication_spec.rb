require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Publication do
  before(:each) do
    @valid_attributes = {
      :authors => "value for authors",
      :title => "value for title",
      :journal => "value for journal",
      :volume => "value for volume",
      :issue => "value for issue",
      :pages => "value for pages",
      :year => "value for year",
      :pubmed => "value for pubmed",
      :medline => "value for medline",
      :abstract => "value for abstract",
      :mesh => "value for mesh",
      :affiliations => "value for affiliations",
      :published_on => Date.today,
      :doi => "value for doi",
      :pii => "value for pii",
      :publication_type => "value for publication_type",
      :source => "value for source",
      :journal_title_abbreviation => "value for journal_title_abbreviation"
    }
  end

  it "should create a new instance given valid attributes" do
    Publication.create!(@valid_attributes)
  end
end
