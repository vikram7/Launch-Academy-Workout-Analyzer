class Workout
  attr_reader :id, :exercises, :date

  def initialize(id, date)
    @id = id
    @date = date
    @exercises = []
  end

  def type
    count_strength = 0
    count_cardio = 0
    count_other = 0
    total = 0

    exercises.each do |each_exercise|
      count_strength += 1 if each_exercise.category == "strength"
      count_cardio += 1 if each_exercise.category == "cardio"
      count_other += 1 if each_exercise.category == "other"
    end

    total = count_strength + count_cardio + count_other

    if count_cardio / total.to_f >= 0.5
      return "cardio"
    elsif count_strength / total.to_f >= 0.5
      return "strength"
    else
      return "other"
    end
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
end
