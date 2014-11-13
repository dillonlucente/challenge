class Person < ActiveRecord::Base
  has_secure_password

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "must be valid email" }, presence: true

end
