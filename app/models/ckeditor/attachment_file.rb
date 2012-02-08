class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                     :storage => :s3,
                      :bucket => 'the_maktaba_website',
                        :s3_credentials => Rails.root.join('config/amazon_s3.yml'),
                        :path => "attachment_files/:filename"
  
  validates_attachment_size :data, :less_than => 10.megabytes
  validates_attachment_presence :data
	
	def url_thumb
	  @url_thumb ||= Ckeditor::Utils.filethumb(filename)
	end
end
