class ChangeNameToOrganizationInCompanies < ActiveRecord::Migration[7.1]
  def change
    rename_column :companies, :name, :organization
  end
end
