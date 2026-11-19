# Dart OOP Assignment: Kigali Bus Card

**Name:** Shams Alola Mohammed  
**Student ID:** 26465  

## My Numbers
- **D:** 65
- **L:** 5
- **Starting balance:** 1000 + (65 × 10) = 1650 RWF
- **Bus fare:** 200 + 65 = 265 RWF
- **Student discount:** 10 + 5 = 15%

## Output of `main.dart`
```text
Error: name too short
Owner: Shams Alola Mohammed | Balance: 1650 RWF
Owner: Shams Alola Mohammed | Balance: 1650 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 265 RWF
Paid 265 RWF
Owner: Shams Alola Mohammed | Balance: 3120 RWF
Student discount: 39 RWF
Paid 226 RWF
Owner: Shams Alola Mohammed | Balance: 1424 RWF
Student card: 15% off
```

## Part 1: Why no setter for `balance`?
A `BusCard` keeps `_balance` private so external code cannot overwrite it freely. If a public setter existed, any part of the program could assign a negative amount or add free money without validation. By allowing changes only through `topUp()` and `pay()`, the class enforces its rules—accepting only top-ups between 500 and 50,000 RWF and blocking rides when the balance is too low.

## Part 2: What does `~/` do?
In Dart, normal division (`/`) returns a decimal (`double`), whereas truncating division (`~/`) divides two numbers and discards everything after the decimal point to produce a whole `int`.

- `print(237 * 17 / 100);` prints `40.29`
- `print(237 * 17 ~/ 100);` prints `40`

Inside `StudentCard.pay()`, using `fare * _discount ~/ 100` ensures the discount is calculated as an exact whole number of Rwandan Francs (`39` RWF instead of `39.75`).

## Part 4: Bug Table (`bug_hunt.dart`)

| Bug | The line | Why it is wrong | My fix |
|-----|----------|-----------------|--------|
| 1 | `super(brand, battery);` inside `{ }` | In Dart, a superclass constructor must be called in the initializer list after `:`, not inside the constructor body. | Moved `: super(brand, battery)` to the constructor signature before `{`. |
| 2 | `super.status;` | Without parentheses `()`, this only references the method instead of executing it, so the parent status never prints. | Changed it to `super.status();`. |
| 3 | `void charge(String amount)` | The parameter type `String` does not match `Device.charge(int amount)`, causing an override signature error. | Changed the parameter type to `int` (`void charge(int amount)`). |
| 4 | `p.battery = 120;` | `Device` defined a `battery` getter without a setter, and a battery percentage cannot exceed 100. | Added `set battery(int value)` that allows only `0` to `100` and rejects invalid values. |
| 5 | `_battery = _battery + amount;` | Calling `charge()` could push `_battery` past 100%. | Added a check in `charge()` so `_battery` stops at `100`. |
| Not a bug | `String get brand => _brand;` | Looks different from `{ return _brand; }`, but arrow syntax is valid Dart shorthand for a single-expression getter. | Left as valid (written with `{ return _brand; }` in my code). |

## Part 5: Prediction & Result

**My prediction:**
```text
Hello from B
```
**Why:** Although the variable `x` is declared with the parent type `A`, the actual object created in memory is an instance of `B`. When `x.intro()` runs and calls `greet()`, Dart uses runtime polymorphism to run `B`'s overridden `greet()` method rather than `A`'s.

**Real output:**
```text
Hello from B
```

**Was I right?**  
Yes, my prediction matched the real output.
