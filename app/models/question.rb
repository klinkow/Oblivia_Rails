class Question < ApplicationRecord
  store :answers_all, accessors: [ :answer_1, :answer_2, :answer_3, :answer_4 ]
end
