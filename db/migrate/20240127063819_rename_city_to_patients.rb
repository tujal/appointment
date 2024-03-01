class RenameCityToPatients < ActiveRecord::Migration[7.1]
  def change
    rename_column :patients, :city, :place
  end
end
