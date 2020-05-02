# frozen_string_literal: true

def play(people)
  enumerated_birthdays = Hash.new(0)

  people.times do
    return true if (enumerated_birthdays[rand(365)] += 1) > 1
  end

  false
end

if ARGV[0].nil?
  rounds = 1000
  people = 23
elsif ARGV[1].nil?
  rounds = ARGV[0].to_i
  people = 23
else
  rounds = ARGV[0].to_i
  people = ARGV[1].to_i
end

totals = {
  'passes' => 0,
  'fails' => 0
}

rounds.times do
  if play(people)
    totals['passes'] += 1
  else
    totals['fails'] += 1
  end
end

puts totals
