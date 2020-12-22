class User < ApplicationRecord
  include AASM

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 4 }
  validates :nickname, presence: true

  before_create :encrypt_password

  has_many :boards
  has_many :posts
  has_many :comments
  has_many :orders

  has_many :favorite_posts
  has_many :my_favorites, through: :favorite_posts, source: 'post'

  def self.login(user)
    pw = Digest::SHA1.hexdigest("a#{user[:password]}z")
    User.find_by(email: user[:email], password: pw)
  end

  def favorite?(post)
    my_favorites.include?(post)
  end

  aasm(column: 'state', no_direct_assignment: true) do
    state :user, initial: true
    state :vip, :vvip

    event :pay_vip do
      transitions from: :user, to: :vip
    end

    event :pay_vvip do
      transitions from: [:user, :vip], to: :vvip
    end
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end
end
