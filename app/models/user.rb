class User < ApplicationRecord
  validates :email, :password, :name, presence: true, length: { maximum: 255 }
  # validates :status, inclusion: {in: [0,1]}
  enum status: [:active, :inactive ]

  has_many: :articles
end
