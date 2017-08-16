class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :integer
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :contact, :string
    add_column :users, :location, :string
    add_column :users, :sched, :date
    add_column :users, :comments, :text
    add_column :users, :payment, :integer
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :role, :string
  end
end
