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

class Users
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| Users.new(datum) }
  end

  def self.find_by_id(id)
    unless self.all.any? {|user| user.id == id}
      raise "#{id} is not in the users database" 
    end
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    Users.new(*data)
  end

  def self.find_by_name(fname,lname)
    unless self.all.any? {|user| user.fname == fname && user.lname = lname}
      raise "#{fname} #{lname} is not in the users database" 
    end
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
      SQL
      Users.new(*data)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
      INSERT INTO
        users (fname,lname)
      VALUES
        (?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end
end

#class Playwright

  #attr_accessor :name, :birth_year, :id

  #def self.all
    #data = QuestionsDatabase.instance.execute("SELECT * FROM playwrights")
    #data.map { |datum| Playwright.new(datum) }
  #end

  #def self.find_by_name(name)
    #unless self.all.any? {|playwright| playwright.name == name}
      #raise "#{name} is not in the playwrights database" 
    #end
    #QuestionsDatabase.instance.execute(<<-SQL, name)
      #SELECT
        #*
      #FROM
        #playwrights
      #WHERE
        #name = ?
    #SQL
  #end

  #def initialize(options)
    #@id = options['id']
    #@name = options['name']
    #@birth_year = options['birth_year']
  #end

  #def create
    #QuestionsDatabase.instance.execute(<<-SQL, self.name, self.birth_year)
    #INSERT INTO
      #playwrights (name, birth_year)
      #VALUES
        #(?, ?)
    #SQL
    #self.id = QuestionsDatabase.instance.last_insert_row_id
  #end

  #def update
    #QuestionsDatabase.instance.execute(<<-SQL, self.name, self.birth_year)
      #UPDATE
        #playwrights
      #SET
        #name = ?, birth_year = ?
      #WHERE
        #id = ?
    #SQL
  #end

  #def get_plays
    #QuestionsDatabase.instance.execute(<<-SQL, self.id)
      #SELECT
        #title
      #FROM
        #plays
      #WHERE
        #playwright_id = ?
    #SQL
  #end
#end