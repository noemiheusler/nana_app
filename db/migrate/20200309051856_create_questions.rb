class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :option_a
      t.text :option_b

      t.timestamps
    end
  end
end
