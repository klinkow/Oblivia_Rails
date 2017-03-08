class TriviaDB


  # def initalize(attributes = {})
  #   @num_of_questions = attributes[:num_of_questions]
  #   @category = attributes[:category]
  #   @difficulty = attributes[:difficulty]
  #   @answer_type = attributes[:answer_type]
  # end
  #
  #
  #
  # attr_accessor :num_of_questions, :category, :difficulty, :answer_type
  #
  # def initalize params
  #   @num_of_questions = params[:num_of_questions]
  #   @category = params[:category]
  #   @difficulty = params[:difficulty]
  #   @answer_type = params[:answer_type]
  # end
  #
  #
  #
  # attr_reader(:num_of_questions, :category, :difficulty, :answer_type)
  #
  # define_method(:initialize) do |attributes|
  #   @num_of_questions = attributes.fetch(:num_of_questions)
  #   @category = attributes.fetch(:category)
  #   @difficulty = attributes.fetch(:difficulty)
  #   @answer_type= attributes.fetch(:answer_type)
  # end
  #
  #
  #
  # @@vehicles = []
  #
  # define_method(:initialize) do |num_of_questions, category, difficulty, answer_type|
  #   @num_of_questions = num_of_questions
  #   @category = category
  #   @difficulty = difficulty
  #   @answer_type= answer_type
  # end




  def get_TriviaDB(category, difficulty, answer_type)
    if category === 'General Knowledge'
      category = "&category=9"
    elsif category === 'Books'
      category = "&category=10"
    elsif category === 'Film'
      category = "&category=11"
    elsif category === 'Music'
      category = "&category=12"
    elsif category === 'Musicals/Theater'
      category = "&category=13"
    elsif category === 'TV'
      category = "&category=14"
    elsif category === 'Video Games'
      category = "&category=15"
    elsif category === 'Science'
      category = "&category=17"
    elsif category === 'Math'
      category = "&category=19"
    elsif category === 'Sports'
      category = "&category=21"
    elsif category === 'Geography'
      category = "&category=22"
    elsif category === 'History'
      category = "&category=23"
    elsif category === 'Art'
      category = "&category=25"
    elsif category === 'Any'
      category = ""
    end

    if difficulty === 'easy'
      difficulty = "&difficulty=easy"
    elsif difficulty === 'medium'
      difficulty = "&difficulty=medium"
    elsif difficulty === 'hard'
      difficulty = "&difficulty=hard"
    elsif difficulty === 'any'
      difficulty = ""
    end

    if answer_type === 'True/False'
      answer_type = "&type=boolean"
    elsif answer_type === 'Multiple Choice'
      answer_type = "&type=multiple"
    elsif answer_type === 'any'
      answer_type = ""
    end

    response = RestClient.get('https://www.opentdb.com/api.php?amount=1' + category + difficulty + answer_type)
    @parsed_response = JSON.parse(response)
    @parsed_response = @parsed_response['results']
    return @parsed_response

  end




end
