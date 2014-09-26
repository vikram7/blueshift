class Comment < ActiveRecord::Base
  validates :text, presence: true, length: { in: (20..320) }
  validates :review, presence: true, uniqueness: :true
  validates :user, presence: true, uniqueness: :true
  belongs_to :review
  belongs_to :user
  def owner?(current_user)
    user == current_user
  end
end
