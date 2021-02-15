class CreatePrimeNumberBefores < ActiveRecord::Migration[5.2]
  def change
    create_table :prime_number_befores do |t|
      t.integer :number
      t.references :prime_number, foreign_key: true

      t.timestamps
    end
  end
end
