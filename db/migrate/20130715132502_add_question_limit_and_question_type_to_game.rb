class AddQuestionLimitAndQuestionTypeToGame < ActiveRecord::Migration
  def change
    add_column :games, :question_limit, :integer
    add_column :games, :question_category, :string
  end
end
