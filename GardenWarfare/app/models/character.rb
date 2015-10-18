class Character < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :type, presence: true
  validates :money, presence: true
  validates :blueMoney, presence: true
  validates :strength, presence: true
  validates :vitality, presence: true
  validates :dexterity , presence: true
  validates :level , presence: true
  validates :experience , presence: true
  validates :inventoryCapacity , presence: true
  validates :user, presence: true


end
