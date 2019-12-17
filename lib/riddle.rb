class Riddle
  attr_reader :id, :question, :answer, :name
  attr_accessor :correct
  @@riddles = {}
  @@total_rows = 0

  def initialize(name, id, question, answer)
    @name = name
    @id = id || @@total_rows += 1
    @question = question
    @answer = answer
    @correct = 0
  end

  def self.all
    @@riddles.values()
  end

  def save
    @@riddles[self.id] = Riddle.new(self.name, self.id, self.question, self.answer)
  end

  def ==(riddle_to_compare)
    self.name() == parcel_to_compare.name()
  end

  def self.hunt(x)
    @@riddles.values().select {|e| /#{x}/i.match? e.name}
  end

  def self.find(id)
    @@riddles[id]
  end

  # def make_correct
  #   self.correct = true
  # end

  def self.answer(user_answer)
    if @user_answer == @right_answer
      @correct = true
    else
      false
    end
  end

  def self.clear
    @@riddles = {}
    @@total_rows = {}
  end

  def delete
    @@riddles.delete(self.id)
  end
end
