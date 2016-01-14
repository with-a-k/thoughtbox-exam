class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: { message: "is required. " }
  validates :email, presence: { message: "is required. " },
                    uniqueness: { message: "is already in use. " }
  validates :password, presence: { message: "is required. " },
                       confirmation: { message: "and confirmation don't match. " }
  validates :password_confirmation, presence: { message: "is required. " }
end
