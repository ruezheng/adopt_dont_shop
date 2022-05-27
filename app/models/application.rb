class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :application_status, presence: true

  attribute :description, :string, default: ' '
  attribute :application_status, :string, default: 'In Progress'

  def approved! # <<<<<< does this need to be ! or change to a boolean ? <<<<<
    if pet_applications.count == pet_applications.where(approved: true).count
      application_status = "Approved"
    elsif pet_applications.where(approved: false).count >= 1
      application_status = "Rejected"
    end
  end
end
