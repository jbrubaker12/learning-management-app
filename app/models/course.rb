class Course < ApplicationRecord
  # Defines an image in our course that we can upload and interact with.
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  has_many :lessons
  has_and_belongs_to_many :categories
  
  # This is because of an error where the first lesson was assumed to be rendered but wasn't because some courses do not have any lessons yet.
  def first_lesson
  	self.lessons.order(:position).first
  end
end
