class Book < ActiveRecord::Base
  has_many :chapters
  attr_accessible :title
  accepts_nested_attributes_for :chapters
end
