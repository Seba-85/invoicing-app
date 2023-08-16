class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :place_of_issue
      t.date :date_of_issue
      t.date :date_of_payment
      t.string :product_name
      t.string :unit
      t.integer :net_price
      t.integer :net_value
      t.integer :vat_rate
      t.integer :amount_of_vat
      t.integer :gross_value
      t.integer :quantity
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
