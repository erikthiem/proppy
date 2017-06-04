class AddResponse1ToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :response1, :string
    add_column :questions, :response2, :string
    add_column :questions, :correct_response, :string
  end
end
