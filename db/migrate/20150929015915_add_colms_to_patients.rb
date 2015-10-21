class AddColmsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :ResourceKey, :integer
    add_column :patients, :content, :json
  end
end
