module Helpers
  def last_modified_note
    Note.asc(:updated_at).last
  end
end
