class CreateCitations < ActiveRecord::Migration
  def self.up
    create_table :citations do |t|
      t.integer :cv_id
      t.string :activity_type
      t.string :activity_id
      t.integer :display_order
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :citations
  end
end
