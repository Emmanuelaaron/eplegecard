class CreatePledgers < ActiveRecord::Migration[6.1]
  def change
    create_table :pledgers do |t|
      t.string :name
      t.string :phonenumber
      t.integer :amount
      t.date :expecteddate
      t.boolean :fullfilled

      t.timestamps
    end
  end
end
