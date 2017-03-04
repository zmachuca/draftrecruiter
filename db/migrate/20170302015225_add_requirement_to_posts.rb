class AddRequirementToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :requirement, :string
  end
end
