# Preview all emails at http://localhost:3000/rails/mailers/loan_mailer
class LoanMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loan_mailer/send_copy_to_email
  def send_copy_to_email
    LoanMailer.send_copy_to_email
  end

end
