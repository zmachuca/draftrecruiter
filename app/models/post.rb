class Post < ActiveRecord::Base
	belongs_to :user
	has_many :resumes

	def self.search(search)
		if search
  		where("title LIKE ? OR location LIKE ? OR industry LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
		end
	end
end
