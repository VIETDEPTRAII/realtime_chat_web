class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :user

      t.timestamps
    end
  end
end
