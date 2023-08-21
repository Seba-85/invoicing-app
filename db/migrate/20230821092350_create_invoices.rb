class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :place_of_issue
      t.date :date_of_issue
      t.date :date_of_payment
      t.string :product_name
      t.string :unit
      t.string :net_price
      t.string :net_value
      t.string :vat_rate
      t.string :amount_of_vat
      t.string :gross_value
      t.string :quantity
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
