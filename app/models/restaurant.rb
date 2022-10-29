class Restaurant < ApplicationRecord
  has_many :foods
  has_many :line_foods, through: :foods

  vaiidates :name, :fee, :time_required, presence: true
  validates :name, length:{ masmum: 30}
  validates :fee, numericality: { greater_than: 0}
end


