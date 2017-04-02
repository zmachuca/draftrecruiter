class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :posts
   has_many :resumes
   has_many :incoming_resumes, through: :posts, source: :resumes
   has_many :unlocks
   has_many :unlocked_resumes, through: :unlocks, source: :resume
end
