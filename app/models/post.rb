class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :category, optional: true
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true
  accepts_nested_attributes_for :category

  scope :filter_by_title, -> (title) { where title: title }
  scope :filter_by_category, -> (category) { where category: category }
end
