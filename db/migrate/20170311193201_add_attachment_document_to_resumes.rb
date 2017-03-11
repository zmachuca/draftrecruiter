class AddAttachmentDocumentToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :resumes, :document
  end
end
