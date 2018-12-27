class AssistancePackageAssistanceJointable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :assistance_packages, :assistances
  end
end
