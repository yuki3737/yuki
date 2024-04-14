class CreateNihons < ActiveRecord::Migration[6.1]
  def change
    create_table :nihons do |t|
      t.string :picture
      t.string :kome
      t.integer :user_id
      t.timestamps
    end
  end
end
