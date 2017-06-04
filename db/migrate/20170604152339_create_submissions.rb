class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.text :name
      t.text :answers
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
