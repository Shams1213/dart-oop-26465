# Dart OOP Assignment - Kigali Bus Card

- **Name:** Shams Alola Mohammed
- **Student ID:** 26465
- **My numbers:** D = 65, L = 5, Starting balance = 1650 RWF, Bus fare = 265 RWF, Student discount = 15%

## Output of main.dart
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

## Questions
- **Why does `BusCard` have a `balance` getter and NO `balance` setter?**
  `BusCard` has no `balance` setter so nobody outside the class can change `_balance` directly to any random number. The balance can only change through `topUp()` and `pay()`, which check the rules first.

- **What does `~/` do in Dart? Show what `237 * 17` gives with `/` and with `~/`.**
  `~/` is integer division in Dart. It divides two numbers and drops the decimal part to return a whole `int`.
  For `237 * 17` (`4029`) divided by `100`:
  - `237 * 17 / 100` gives `40.29` (a `double`)
  - `237 * 17 ~/ 100` gives `40` (an `int`)

## Part 4 - Bugs Found in `bug_hunt.dart`

| # | Line | What was wrong | How I fixed it |
|---|------|----------------|----------------|
| 1 | `super(brand, battery);` inside `{ }` | `super(...)` was called inside the constructor body instead of the initializer list | Moved `: super(brand, battery)` to the constructor header before `{` |
| 2 | `super.status;` | Missing parentheses `()`, so the parent method was never actually called | Changed it to `super.status();` |
| 3 | `void charge(String amount)` | Parameter type was `String`, which does not match `Device.charge(int amount)` | Changed parameter type to `int` (`void charge(int amount)`) |
| 4 | `p.battery = 120;` | `Device` had no `battery` setter, and battery values should only be `0` to `100` | Added `set battery(int value)` to accept only `0` to `100` and reject invalid values |
| 5 | `_battery = _battery + amount;` | `charge()` allowed `_battery` to go above `100%` | Added a check in `charge()` to cap `_battery` at `100` |

- **Line that looks wrong but is actually valid Dart:**
  `String get brand => _brand;` is valid Dart syntax. It is a short one-line arrow getter that returns `_brand`.

## Part 5 - Read Before Running
- **My prediction (written before running):**
  I predict it will print `Hello from B`. Even though `x` has type `A`, the actual object created in memory is `B()`, so when `intro()` calls `greet()`, Dart runs `B`'s overridden `greet()` method.

- **Actual output:**
  *(To be added after running)*

- **Was I right?**
  *(To be added after running)*
