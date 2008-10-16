class CreateGrants < ActiveRecord::Migration
  def self.up
    create_table :grants do |t|
      t.integer :person_id
      
      # Identification
      t.text :title
      t.text :description
      
      # Detail
      t.text :pi
      t.string :role
      t.string :effort
      
      # Type
      t.string :direct_costs
      t.string :grant_type
      
      # Time
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end

  def self.down
    drop_table :grants
  end
end
