class CreateChallengeRequests < ActiveRecord::Migration
  def change
    create_table :challenge_requests do |t|
      t.string :text
      t.boolean :complete, default: false
      t.integer :person_id
      t.integer :assignee_id

      t.timestamps
    end
  end
end
