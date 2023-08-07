module ViewHelper
  def company_present?
    @user.company.present?
  end
end
