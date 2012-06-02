class Til
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  field :content, :type => String

  validates_presence_of :content
end
