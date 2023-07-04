class User < ApplicationRecord
    has_secure_password

    has_many :shortened_url, dependent: :destroy

    validates :first_name, :last_name, :email, :phone, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true, length: { minimum: 8, message: 'Password must be at least 8 characters' }
    validates_with EmailAddress: :ActiveRecordValidator, field: :email

    


    def name
        "#{first_name} #{last_name}"
    end
    
    def token
        update(auth_token: JsonWebToken.encode({ user_id: id }))
        auth_token
    end
end
