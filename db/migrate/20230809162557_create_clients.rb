class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :owner_name
      t.string :owner_last_name
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :province
      t.string :country
      t.string :tax_number
      t.string :regon
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
