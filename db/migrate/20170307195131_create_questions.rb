class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer_correct
      t.string :answers_all
      t.string :correct_response
      t.string :wrong_response
      t.integer :number
      t.string :topic
      t.integer :round
      t.string :player
      t.boolean :fitb?
      t.boolean :mc?
      t.boolean :tf?
      t.boolean :finished?

      t.timestamps
    end
  end
end
