class Exercise
  attr_reader :category, :duration, :intensity, :name

  def initialize(attributes)
    @category= attributes[:category]
    @duration = attributes[:duration]
    @intensity = attributes[:intensity]
    @name = attributes[:name]
  end
end
