class ChangeQuestionInQuestions < ActiveRecord::Migration
  def change
    rename_column(:questions, :question, :text)
  end
end
