class AddAttributesToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :tickets_solved_count, :integer, default: 0
    add_column :users, :role, :integer, default: 0
    add_column :users, :image_url, :string
    add_column :users, :prefered_topic, :string
    add_column :users, :available, :boolean, default: false
    add_column :users, :batch_count, :integer
    add_column :users, :lessons_count, :integer
  end
end
