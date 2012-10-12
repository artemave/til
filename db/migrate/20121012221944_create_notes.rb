class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.column :content, :text
    end
  end
end
