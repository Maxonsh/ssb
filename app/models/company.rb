class Company < ApplicationRecord
  attr_accessor :abn_confirm

  has_many :users, :dependent => :destroy

  validates :abn, :name, :presence => true, :if => :abn_confirm
  validates :abn, :length => { :is => 11 }, :if => :abn_confirm
  validates :abn, :uniqueness => true, :allow_blank => true

  after_commit :validate_abn, :if => :abn_confirm

  private

  def validate_abn
    ValidateAbnJob.perform_later(self, abn)
  end
end
