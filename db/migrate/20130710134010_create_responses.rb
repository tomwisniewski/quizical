class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :game_id
      t.boolean :value

      t.timestamps
    end
  end
end
