class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :s3,
                      :bucket => 'the_maktaba_website',
                        :s3_credentials => Rails.root.join('config/amazon_s3.yml'),
	                  :styles => { :content => '400>', :original => '500>'}
	validates_attachment_size :data, :less_than => 1.megabytes
	validates_attachment_presence :data
	
	def url_content
	  url(:content)
	end
end
