class AddStartsOnAndEndsOnToRevus < ActiveRecord::Migration
  def self.up
    add_column :revus, :starts_on, :date
    add_column :revus, :ends_on, :date
  end

  def self.down
    remove_column :revus, :starts_on
    remove_column :revus, :ends_on
  end
end
