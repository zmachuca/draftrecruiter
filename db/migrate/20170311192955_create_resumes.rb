class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.references :users, index: true, foreign_key: true
      t.references :posts, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
