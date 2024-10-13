class User < ApplicationRecord
    before_save :encrypt_password
    
    attr_accessor :plain_password
    
    def encrypt_password
        if plain_password.present?
            self.pass = BCrypt::Password.create(plain_password)
        end
    end
    
    def authenticate(input_password)
        BCrypt::Password.new(pass) == input_password
    end
end
