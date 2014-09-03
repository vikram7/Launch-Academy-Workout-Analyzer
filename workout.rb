class Workout
  attr_reader :exercises

  def initialize(exercises)
    @exercises = exercises
  end

  def total_type
    count_strength = 0
    count_cardio = 0
    count_other = 0
    total = 0
    exercises.each do |each_exercise|
      count_strength += 1 if each_exercise[:category] == "strength"
      count_cardio += 1 if each_exercise[:category] == "cardio"
      count_other += 1 if each_exercise[:category] == "other"
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
    exercises.each do |each_exercise|

      if each_exercise[:category] == "strength"
        total += each_exercise[:duration_in_min] * low_mult
      elsif each_exercise[:intensity] == "high"
        total += each_exercise[:duration_in_min] * high_mult
      elsif each_exercise[:intensity] == "medium"
        total += each_exercise[:duration_in_min] * medium_mult
      elsif each_exercise[:intensity] == "low"
        total += each_exercise[:duration_in_min] * low_mult
      else
        total += each_exercise[:duration_in_min] * all_other_mult
      end
    end
    total
  end

  def total_duration
    total = 0
    exercises.each do |each_exercise|
      total += each_exercise[:duration_in_min]
    end
    total
  end
end
