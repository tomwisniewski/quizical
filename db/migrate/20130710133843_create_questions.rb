class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :question
      t.boolean :answer
      t.string :category

      t.timestamps
    end
  end
end
