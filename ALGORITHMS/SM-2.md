# Algorithms inputs

## 1) User grade

- 5 perfect response
- 4 correct response after a hesitation
- 3 correct response recalled with serious difficulty
- 2 incorrect response; where the correct one seemed easy to recall
- 1 incorrect response; the correct one remembered
- 0 complete blackout.

### 0...2

The user was not able to record the information

### 3...5

The user was able to record the information

## 2) Repetition number

Represented the number of times that the user answered with a successful record, in other words, the grade was `3...5`

## 3) Easiness factor

Its a number that represent how easy the card is, it's start with a number 2.5, that will calculated acording the user interact with the same card, redicing the factor at the minum 1.3
Lower easiness is more dificult and highest is more easy

## 4) Interval

Its the amount of days you should give the card against to the student

```ruby
class Sm2
  def initialize(grade, success_repetiton = 0, easiness_factor = 2.5)
    @grade = grade
    @success_repetiton = success_repetiton
    @easiness_factor = easiness_factor
    @interval = 0
  end

  def call
    if @grade >= 3
      if @success_repetiton == 0
        @interval = 1
      elsif @success_repetiton == 1
        @interval = 6
      else
        @interval = @success_repetiton * @easiness_factor
      end
      @success_repetiton += 1
    else
      @success_repetiton = 0
      @interval = 1
    end

    @easiness_factor = @easiness_factor + (0.1 - (5 - @grade) * (0.08 + (5 - 1) * 0.02 ))

    # the easiness factor can't be lowest than 1.3
    @easiness_factor = 1.3 if @easiness_factor < 1.3

    return [@success_repetiton, @easiness_factor, @interval]
  end
end
```

## References

> https://super-memory.com/english/ol/sm2.htm
