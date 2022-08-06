class CreateExpensesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :amount
      t.belongs_to :user, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
