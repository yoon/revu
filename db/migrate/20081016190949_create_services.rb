class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :person_id
      
      # Identification
      t.string :identifier
      t.text :title
      t.text :description
      
      # Detail
      t.text :organization

      # Type
      t.string :service_type
      
      # Time
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
