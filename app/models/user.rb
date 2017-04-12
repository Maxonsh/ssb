class User < ApplicationRecord
  acts_as_authentic

  has_many :properties
  has_many :offers, :through => :properties

  before_validation :set_password
  after_commit :send_welcome_email

  private

  def set_password
    @password = SecureRandom.base64(8)

    self.password = @password
    self.password_confirmation = @password
  end

  def send_welcome_email
    SendPasswordJob.perform_later(self, @password)
  end
end
