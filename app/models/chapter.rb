class Chapter < ActiveRecord::Base
  belongs_to :book
  attr_accessible :book_id, :nr_of_pages
  validates_numericality_of :nr_of_pages
end
