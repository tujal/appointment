class AddDetailsToPatients < ActiveRecord::Migration[7.1]
  def up
    add_column :patients, :email, :string
  end

  def down
    remove_column :patients, :email
  end
end
