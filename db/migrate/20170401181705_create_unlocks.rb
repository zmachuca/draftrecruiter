class CreateUnlocks < ActiveRecord::Migration
  def change
    create_table :unlocks do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :resume, index: true
      t.timestamps null: false
    end
  end
end
