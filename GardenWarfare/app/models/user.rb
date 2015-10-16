class User < ActiveRecord::Base
	validates :email, presence: true, email: true
	validates :password, presence: true
	validates :name, presence: true
	has_many :tokens

	def self.from_omniauth(data) #{provider: 'face', iod: '12345', info: {email: '..', name: 'nombre'}}
      
    User.where(provider: data[:provider], uid: data[:uid]).first_or_create do |user|
      user.email = data[:info][:email]
      user.password = data[:info][:password]
      user.name = data[:info][:name]
    end

  end
end	
