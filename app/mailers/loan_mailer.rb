class LoanMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.loan_mailer.send_copy_to_email.subject
  #
  def send_copy_to_email(loan)
    @loan = loan
    # New empty arrays
    @payments = Array.new(@loan.periods(@loan))
    @principals = Array.new(@loan.periods(@loan))
    @interests = Array.new(@loan.periods(@loan))
    @balances = Array.new(@loan.periods(@loan))

    # Initial conditions
    @payments[0] = 0
    @principals[0] = 0
    @interests[0] = 0
    @balances[0] = @loan.amount

    # Fill arrays
    for i in(1..@loan.periods(@loan))
      if i != @loan.periods(@loan)
        @payments[i] = @loan.payment(@loan)
      else
        @payments[i] = @loan.payment(@loan)
      end
      @interests[i] = ((@balances[i-1]) * (@loan.interest_rate/@loan.payment_id_yearly_frecuency(@loan.payment_id))).round(2)
      @principals[i] = (@payments[i] - @interests[i]).round(2)
      if i == @loan.periods(@loan)
        @balances[i] = (@balances[i-1] - @payments[i] + @interests[i]).round(0)
      else
        @balances[i] = (@balances[i-1] - @payments[i] + @interests[i]).round(2)
      end
    end
    
    mail to: "#{@loan.email_to_send}", subject: "Tu copia de prestacalculadora está lista", from: "no-reply@sandbox10243.mailgun.org"
  end
end
