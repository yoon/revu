class CreateRevus < ActiveRecord::Migration
  def self.up
    create_table :revus do |t|
      t.integer :person_id
      t.integer :revuable_id
      t.string :revuable_type
      t.string :type
      t.float :effort
      t.float :academic_value
      t.float :author_rank_score
      t.float :impact_factor
      t.float :role
      t.float :score
      t.float :funding_modifier
      t.float :pi_status

      t.timestamps
    end
  end

  def self.down
    drop_table :revus
  end
end
