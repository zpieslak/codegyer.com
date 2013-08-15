class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.string :token

      t.timestamps
    end

    add_index :subscriptions, :email
    add_index :subscriptions, :token
  end
end
