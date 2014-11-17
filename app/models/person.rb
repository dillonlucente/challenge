class Person < ActiveRecord::Base
  has_secure_password

  has_many :challenge_requests
  has_many :challenges, class_name: "ChallengeRequest", foreign_key: :assignee_id

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "must be valid email" }, presence: true, uniqueness: true

  def can_challenge?
    self.tokens.present? && self.tokens > 0
  end

end
