class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.integer :person_id
      
      # Identification
      t.string :identifier
      t.text :title
      t.text :description
      
      # Detail
      t.text :meeting
      t.text :location

      # Type
      t.string :presentation_type

      # Time
      t.date :presented_on

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
