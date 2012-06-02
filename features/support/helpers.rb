module Helpers
  def last_modified_til
    Til.asc(:updated_at).last
  end
end
