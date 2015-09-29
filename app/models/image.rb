class Image < ActiveRecord::Base
  belongs_to :question

  def initialize(params = {})
  file = params.delete(:data)
  super
  if file
    self.filename = sanitize_filename(file.original_filename)
    self.mime_type = file.content_type
    self.data = file.read
  end
end
private
  def sanitize_filename(filename)
    return File.basename(filename)
  end

end