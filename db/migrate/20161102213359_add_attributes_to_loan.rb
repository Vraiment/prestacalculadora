class AddAttributesToLoan < ActiveRecord::Migration[5.0]
  def change
    # add_column :model_in_plural, :attribute, :data_type
    add_column :loans, :interest_rate, :decimal
    add_column :loans, :amount, :decimal
    add_column :loans, :term, :integer
    add_column :loans, :term_id, :integer
    add_column :loans, :payment_id, :integer
    add_column :loans, :email_to_send, :string
  end
end
