class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :unlocks
  has_many :owned_user, :through => :unlocks, source: :resume

  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ["application/pdf", "application/doc", "application/docx"], :message => "You must upload DOC or PDF only"
end
