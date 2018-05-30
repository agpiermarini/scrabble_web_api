class Word
  attr_reader :id, :inflection
  def initialize(id, inflection)
    @id = id
    @inflection = inflection
  end
end
