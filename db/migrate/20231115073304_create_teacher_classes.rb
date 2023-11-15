class CreateTeacherClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_classes do |t|
      t.references :class, foreign_key: true
      t.references :teacher, foreign_key: true
      t.timestamps
    end
  end
end
