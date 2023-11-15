class CreateStudentQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :student_questions do |t|
      t.integer :grade
      t.string :question
      t.string :answer

      t.references :student, foreign_key: true
      t.references :question, foreign_key: true
      t.timestamps
    end
  end
end
