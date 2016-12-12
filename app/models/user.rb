class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  before_validation :set_default_role
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorite_for(post)
     favorites.where(post_id: post.id).first
  end

  private
    def set_default_role
      self.role ||= Role.find_by_name('registered')
    end
end
