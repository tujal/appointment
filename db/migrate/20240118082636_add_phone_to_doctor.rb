class AddPhoneToDoctor < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :phone, :integer
  end
end
