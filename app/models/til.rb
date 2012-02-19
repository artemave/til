class Til
  include Mongoid::Document
  field :content, :type => String

  validates_presence_of :content
end
