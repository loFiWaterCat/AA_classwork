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

    #  raise "#{self} not in database" unles
     p "self is #{self} "
     p user
    #  User.new(user.first)
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

end

class QuestionFollow
end

class Reply
end

class QuestionLike
end

