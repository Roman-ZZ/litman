class User < ApplicationRecord
  validates :email, :password, :name, presence: true, length: { maximum: 255 }
end
