class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.integer :person_id

      # Identification
      t.string :identifier
      t.string :pubmed_identifier
      t.string :medline_identifier
      t.text :digital_object_identifier
      t.text :controlled_publisher_identifier
      
      # Detail
      t.text :authors
      t.text :title
      t.string :journal
      t.string :journal_abbreviation
      t.string :volume
      t.string :issue
      t.string :pages
      t.text :abstract
      t.text :mesh
      t.text :affiliations
      t.text :source

      # Type
      t.string :publication_type
      
      # Time
      t.string :year
      t.date :published_on
      
      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
