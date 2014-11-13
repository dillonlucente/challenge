class AddTokensToPeople < ActiveRecord::Migration
  def change
    add_column :people, :tokens, :integer
  end
end
