require 'digest'

# User model
class User < ApplicationRecord
    validates :login, uniqueness: true

    class << self
        def authenticate(login, pass)
            usr = User.find_by(login: login)
            return nil if usr.nil?
            return usr if usr.check_passw?(pass)
        end

        def create_user(login, pass, pass_d)
            hash = Digest::SHA256.hexdigest(pass)
            hash_d = Digest::SHA256.hexdigest(pass_d)
            return User.new unless hash == hash_d
            create(login: login, password_digest: hash)
        end
    end

    def check_passw?(password)
        password_digest == Digest::SHA256.hexdigest(password)
    end
end