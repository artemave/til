class Til
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  field :content, :type => String

  validates_presence_of :content

  def self.last_modified
    asc(:updated_at).last
  end
end
