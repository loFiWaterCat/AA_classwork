require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']

  end

  def self.find_by_id(id)



       user = QuestionsDatabase.instance.execute(<<-SQL, id)

       SELECT
         *
       FROM
        users
       WHERE
        id = ?
     SQL

     raise " User not in database" if user.empty?
   
     User.new(user.first)
  end


  def self.find_by_name(fname)

    user = QuestionsDatabase.instance.execute(<<-SQL, fname)

       SELECT
         *
       FROM
        users
       WHERE
        fname = ?
     SQL

     User.new(user[0])

  end
end

class Question
  attr_accessor :id, :title , :body , :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body= options['body']
    @user_id = options['user_id']
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
    SQL

    raise " Question not in database" if question.empty?

  Question.new(question[0])

  end

  def self.find_by_author_id(user_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      *
    FROM
      questions
    WHERE
      user_id = ?
    SQL
  
    question.map { |datum| Question.new(datum) }
  end
end

class QuestionFollow
  attr_accessor :id, :user_id, :question_id

  def self.all
     data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
     data.map{|datum| QuestionFollow.new(datum)}
  end

  def initialize(options)
       @id = options['id']
       @user_id = options['user_id']
       @question_id=options["question_id"]

  end

  def self.find_by_id(id)

    follows = QuestionsDatabase.instance.execute(<<-SQL, id )

         SELECT
         *
         FROM
         question_follows 
         WHERE
         id = ?
    SQL
      
    raise "Follow not in database" if follows.empty?
     QuestionFollow.new(follows.first)
  end
end

def 


end

class Reply
  attr_accessor :id, :user_id, :question_id , :body, :parent_reply_id

  def self.all
     data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
     data.map{|datum| Reply.new(datum)}
  end

  def initialize(options)
       @id = options['id']
       @user_id = options['user_id']
       @question_id=options["question_id"]
       @parent_reply_id = options['parent_reply_id']  

  end
end

class QuestionLike
end

