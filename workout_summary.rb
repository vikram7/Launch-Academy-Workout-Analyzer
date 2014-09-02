require_relative 'workout'
require 'csv'
require 'table_print'

# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end

  workouts
end

puts "ID | DATE       | TYPE     | DURATION | CALORIES_BURNED"
puts "---|------------|----------|----------|----------------"

load_workout_data('workouts.csv').each do |each_workout_day|
  my_workout = Workout.new(each_workout_day.last[:exercises])

  a = each_workout_day.first
  b = each_workout_day.last[:date]
  c = my_workout.total_type
  d = my_workout.total_duration
  e = my_workout.total_calories_burned


  print a.to_s + "  | " + b.to_s + "  | " + c.to_s + "  | " + d.to_s + "  | " + e.to_s + "\n"
end

