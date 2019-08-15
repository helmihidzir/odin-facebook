class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate :not_self
  validate :not_friends
  validate :not_pending

  # validates :user, presence: true
  # validates :friend, presence: true, uniqueness: { scope: :user }

  def accept
    user.friends << friend
    destroy
  end

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

  def not_friends
    errors.add(:friend, 'already added') if user.friends.include?(friend)
  end

  def not_pending
    errors.add(:friend, 'request is waiting to be accepted') if user.pending_friends.include?(friend) || friend.pending_friends.include?(user)
  end
end
