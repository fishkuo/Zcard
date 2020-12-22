class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :post

  default_scope { order(id: :desc) }

  validates :content, presence: true
end
