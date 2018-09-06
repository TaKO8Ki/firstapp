class CreateAddFollowingsCountToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_followings_count_to_users do |t|
      t.integer :followings_count

      t.timestamps
    end
  end
end
