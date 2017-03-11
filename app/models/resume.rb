class Resume < ActiveRecord::Base
  belongs_to :users
  belongs_to :posts

  has_attached_file :document
end
