class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true,
            messages: {
                      presence: "We need your email address",
                      format: "Invalid email format",
                      is_unique: "This email address is already taken"
            }
  property :password_digest, String, length: 60

end
