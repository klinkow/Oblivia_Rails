class FixQuestionsNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :fitb?, :fitb
    rename_column :questions, :mc?, :mc
    rename_column :questions, :tf?, :tf
    rename_column :questions, :finished?, :finished
  end
end
