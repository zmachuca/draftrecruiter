class AddIndustryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :industry, :string
  end
end
