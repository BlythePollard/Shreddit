class AddCategoriesToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :category_id, :integer
  end
end
