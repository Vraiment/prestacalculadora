class Loan < ApplicationRecord

  # Return fixed payment during all loan
  def payment
    return (@loan.amount * ( (@loan.interest_rate/@loan.payment_id_yearly_frecuency/(1-((1+@loan.interest_rate/@loan.payment_id_yearly_frecuency)**(periods(@loan) * -1)))) )).round(2)
  end

  # Return total interest
  def total_interest
    return (@loan.payment * @loan.periods(@loan)) - @loan.amount
  end

  # Return total to pay
  def total_to_pay
    return @loan.payment * @loan.periods(@loan)
  end

  # Return numbers of periods depending on term_id
  def periods(loan)
    @loan = loan
    if @loan.term_id == 1
      return @loan.term * (@loan.payment_id_monthly_frecuency)
    else
      return @loan.term * (@loan.payment_id_yearly_frecuency)
    end
  end

  # Return user friendly payment_id name
  def payment_name
    case @loan.payment_id
    when 1 then 'mensuales'
    when 2 then 'quincenales'
    when 3 then 'semanales'
    else 'mensuales'
    end
  end

  # Return yearly frecuency by selected payment_id
  def payment_id_yearly_frecuency
    case @loan.payment_id
    when 1 then 12
    when 2 then 24
    when 3 then 52
    else 12
    end
  end

  # Return monthly frecuency by selected payment_id
  def payment_id_monthly_frecuency
    case @loan.payment_id
    when 1 then 1
    when 2 then 2
    when 3 then 4
    else 12
    end
  end

end
