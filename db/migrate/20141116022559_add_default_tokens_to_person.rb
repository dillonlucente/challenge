class AddDefaultTokensToPerson < ActiveRecord::Migration
  def change
    change_column :people, :tokens, :integer, default: 5
  end
end
