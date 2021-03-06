class User < ActiveRecord::Base
	validates :email, presence: true, email: true
	validates :name, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
	has_many :tokens
  has_one :character

	def self.from_omniauth(data) #{provider: 'face', iod: '12345', info: {email: '..', name: 'nombre'}}
      
    User.where(provider: data[:provider], uid: data[:uid]).first_or_create do |user|
      user.email = data[:info][:email]
      user.name = data[:info][:name]
    end

  end
end	
