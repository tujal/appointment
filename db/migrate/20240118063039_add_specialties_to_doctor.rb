class AddSpecialtiesToDoctor < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :specialties, :string
  end
end
