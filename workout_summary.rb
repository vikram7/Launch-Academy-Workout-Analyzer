require_relative 'exercise'
require_relative 'workout'

require 'csv'
require 'table_print'

def load_workout_data(filename)
  workouts = []

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    workout = workouts.find { |w| w.id == workout_id }

    if workout.nil?
      workout = Workout.new(workout_id, row[:date])
      workouts << workout
    end

    exercise = Exercise.new(
      name: row[:exercise],
      category: row[:category],
      duration: row[:duration_in_min],
      intensity: row[:intensity]
    )

    workout.exercises << exercise
  end

  workouts
end

workouts = load_workout_data('workouts.csv')

tp(workouts, :id, :date, :type, :duration, :total_calories_burned)
