# birthday_problem: in code

You probably already know the problem.
There's a 50/50 chance of two people having the same birthday in a 365-day calendar year.
How?

Intuitively, humans think in addition, subtraction, multiplication, division.
But the math invovled in the birthday problem involves exponents, and boy do we suck at exponents.

Let's look at the code.

## Ruby Code

```ruby
def play(people)
  enumerated_birthdays = Hash.new(0)

  people.times do
    enumerated_birthdays[rand(365)] += 1
  end

  enumerated_birthdays.each do |_key, val|
    return true if val > 1
  end
  false
end
```

Hmm... still no exponents. We're getting there trust me.
But in this code from `birthday_problem.rb`, we can see how we determine a birthday being shared or not.

## Simulation

When running `ruby birthday_problem.rb`, a 1000 test cases will run and a hash will be printed. In a run, I got:

`{"passes"=>502, "fails"=>498}`

As we can see, we got pretty close to getting 50/50. But how?

## Explanation

Let's think about this problem in handshakes.
When there are 23 people (including ourselves), we shake hands with 22 other people.
But we don't need to be part of the two people who share a birthday.
We need to account that other people shake hands with each other,
so the total amount of handshakes is actually:

<p align="center">
  <img src="https://user-images.githubusercontent.com/18503982/80858114-cfb5ea00-8c1c-11ea-9e88-08f22bd405ca.gif">
</p>

And in each handshake, there is a 1/365 chance of the two people sharing birthdays.
We can use this information and use the "At least 1" rule:
The chances of having "At least 1" is the same probability of 1 - None

<p align="center">
  <img src="https://user-images.githubusercontent.com/18503982/80858627-1a853100-8c20-11ea-8e16-bd24590575b6.gif">
</p>

We barely have over a 50% chance of two people sharing a birthday when it comes to 23 people.
