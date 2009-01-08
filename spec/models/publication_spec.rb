# == Schema Information
# Schema version: 20090107212312
#
# Table name: publications
#
#  id                              :integer         not null, primary key
#  person_id                       :integer
#  identifier                      :string(255)
#  pubmed_identifier               :string(255)
#  medline_identifier              :string(255)
#  digital_object_identifier       :text
#  controlled_publisher_identifier :text
#  authors                         :text
#  title                           :text
#  journal                         :string(255)
#  journal_abbreviation            :string(255)
#  volume                          :string(255)
#  issue                           :string(255)
#  pages                           :string(255)
#  abstract                        :text
#  mesh                            :text
#  affiliations                    :text
#  source                          :text
#  publication_type                :string(255)
#  year                            :string(255)
#  published_on                    :date
#  created_at                      :datetime
#  updated_at                      :datetime
#

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
