class ApplicationController < ActionController::Base


  def index
    render plain: "Everyone can see me!"
  end

  def edit
    render plain: "I'm only accessible if you know the password"
  end
  # require 'bcrypt'

  # class PasswordDigester
  #   def self.encrypt(password)
  #     BCrypt::Password.create(password)
  #   end

  #   def self.check?(password, encrypted_password)
  #     BCrypt::Password.new(encrypted_password) == password
  #   end
  # end

  # # For testing
  # if $0 == __FILE__
  #   password = ARGV.shift

  #   encrypted = PasswordDigester.encrypt password

  #   success = PasswordDigester.check? password, encrypted

  #   puts encrypted, success
  # end



  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  private

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

end
