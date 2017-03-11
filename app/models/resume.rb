class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ["application/pdf", "application/doc"], :message => "DOC or PDF only"
end
