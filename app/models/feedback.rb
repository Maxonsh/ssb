class Feedback < ApplicationRecord
  validates :message, :presence => true
  validates :phone_number, :numericality => { :only_integer => true }, :if => :phone_present?

  private

  def phone_present?
    phone_number.present?
  end
end
