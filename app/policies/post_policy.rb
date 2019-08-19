class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    user.present? && user == post.user
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user == post.user
  end

  def liked?
    true
  end

  def unliked?
    true
  end

  private

  def post
    record
  end
end
