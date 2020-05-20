class AddDescriptionToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :description, :string
  end
end
