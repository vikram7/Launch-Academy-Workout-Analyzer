class Workout
  attr_reader :id, :exercises, :date

  def initialize(id, date)
    @id = id
    @date = date
    @exercises = []
  end

  def type
    total = exercises.count
    type = 'other'

    exercise_categories.each do |category|
      category_percentage = exercises_for_category(category).count / total.to_f
      type = category if category_percentage >= 0.5
    end

    type
  end

  def total_calories_burned
    high_mult = 10
    medium_mult = 8
    low_mult = 5
    all_other_mult = 6
    total = 0

    exercises.each do |exercise|
      if exercise.category == "strength"
        total += exercise.duration * low_mult
      elsif exercise.intensity == "high"
        total += exercise.duration * high_mult
      elsif exercise.intensity == "medium"
        total += exercise.duration * medium_mult
      elsif exercise.intensity == "low"
        total += exercise.duration * low_mult
      else
        total += exercise.duration * all_other_mult
      end
    end

    total
  end

  def duration
    total = 0
    exercises.each do |each_exercise|
      total += each_exercise.duration
    end
    total
  end

  def exercises_for_category(category)
    exercises.find_all { |e| e.category == category }
  end

  def exercise_categories
    exercises.map { |e| e.category }.uniq
  end
end
