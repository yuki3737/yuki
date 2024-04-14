class AddDetailsToNihons < ActiveRecord::Migration[6.1]
  def change
    add_column :nihons, :content, :string
    add_column :nihons, :body, :text
  end
end
