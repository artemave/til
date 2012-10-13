module Helpers
  def last_modified_note
    Note.order('updated_at ASC').last
  end
end
