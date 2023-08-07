class ChangeCompanyDataToCompany < ActiveRecord::Migration[7.0]
  def change
    rename_table :company_data, :companies
  end
end
