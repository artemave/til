class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :uid, :string
      t.column :provider, :string
    end
  end
end
