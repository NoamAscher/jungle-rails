class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

    def order_confirmation(user, order)
      @user = user
      @order = order
      mail(to: current_user.email, subject: 'Order #{order[:id]} has been received')
    end
  end
end
