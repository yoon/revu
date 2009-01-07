class CreateCvs < ActiveRecord::Migration
  def self.up
    create_table :cvs do |t|
      t.integer :person_id
      t.string :identifier
      t.string :title
      t.string :citation_format

      t.timestamps
    end
  end

  def self.down
    drop_table :cvs
  end
end
