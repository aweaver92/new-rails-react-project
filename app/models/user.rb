class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true, format: {with: 
    URI::MailTo::EMAIL_REGEXP}

    PASSWORD_REQUIREMENTS = /\A
        (?=.{8,}) # makes it min 8 char. long
        (?=.\d) # min 1 num
    /x
    validates :password, presence: true, format: PASSWORD_REQUIREMENTS

end

# (?=.*[a-z]) # min 1 lower case
#         (?=.*[A-Z]) # min 1 upper case
#         (?=.*[[:^alnum:]]) # min one symbol
