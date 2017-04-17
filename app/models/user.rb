class User < ApplicationRecord
  acts_as_authentic

  has_many :properties
  has_many :offers, :through => :properties

  belongs_to :company
  accepts_nested_attributes_for :company

  before_validation :set_password, :if => :new_record?
  after_commit :send_welcome_email

  private

  def set_password
    @password = SecureRandom.base64(8)
    @new_user = true

    self.password = @password
    self.password_confirmation = @password
  end

  def send_welcome_email
    return unless @new_user

    SendPasswordJob.perform_later(self, @password)
  end
end
