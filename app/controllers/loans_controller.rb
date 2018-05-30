class LoansController < ApplicationController
  # before_action :set_loan, only: [:show, :edit, :update, :destroy]
  before_action :set_loan, only: [:show, :send_to_email]

  def index
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.interest_rate = @loan.interest_rate/100
    @loan.save
    redirect_to @loan
  end

  # def send_to_email
  #   @loan.update(loan_params)
  #   LoanMailer.send_copy_to_email(@loan).deliver_later
  #   redirect_to @loan
  # end

  def show
    @periods = @loan.periods(@loan)
    @payment_name = @loan.payment_name
    @payment = @loan.payment
    @amount = @loan.amount
    @interest_rate_percentage = @loan.interest_rate * 100
    @interest_rate = @interest_rate_percentage / 100
    @total_interest = @loan.total_interest
    @total_to_pay = @loan.total_to_pay
    @payment_id_yearly_frecuency = @loan.payment_id_yearly_frecuency
    # # New empty arrays
    # @payments = Array.new(@loan.periods(@loan))
    # @principals = Array.new(@loan.periods(@loan))
    # @interests = Array.new(@loan.periods(@loan))
    # @balances = Array.new(@loan.periods(@loan))
    #
    # # Initial conditions
    # @payments[0] = 0
    # @principals[0] = 0
    # @interests[0] = 0
    # @balances[0] = @loan.amount
    #
    # # Fill arrays
    # for i in(1..@loan.periods(@loan))
    #   if i != @loan.periods(@loan)
    #     @payments[i] = @loan.payment(@loan)
    #   else
    #     @payments[i] = @loan.payment(@loan)
    #   end
    #   @interests[i] = ((@balances[i-1]) * (@loan.interest_rate/@loan.payment_id_yearly_frecuency(@loan.payment_id))).round(2)
    #   @principals[i] = (@payments[i] - @interests[i]).round(2)
    #   if i == @loan.periods(@loan)
    #     @balances[i] = (@balances[i-1] - @payments[i] + @interests[i]).round(0)
    #   else
    #     @balances[i] = (@balances[i-1] - @payments[i] + @interests[i]).round(2)
    #   end
    # end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:interest_rate, :amount, :term, :term_id, :payment_id, :email_to_send)
    end

end
