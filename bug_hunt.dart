class Device {
  String _brand = '';
  int _battery = 100;

  Device(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  String get brand {
    return _brand;
  }

  int get battery {
    return _battery;
  }

  // Setter that only accepts battery values from 0 to 100
  set battery(int value) {
    if (value < 0 || value > 100) {
      print('Error: battery must be 0 to 100');
    } else {
      _battery = value;
    }
  }

  void charge(int amount) {
    _battery = _battery + amount;
    if (_battery > 100) {
      _battery = 100;
    }
  }

  void status() {
    print('$_brand: $_battery%');
  }
}

class Phone extends Device {
  String _number = '';

  // Fix 1: call super(brand, battery) in the initializer list
  Phone(String brand, int battery, String number) : super(brand, battery) {
    _number = number;
  }

  @override
  void status() {
    // Fix 2: add () to actually call super.status()
    super.status();
    print('Number: $_number');
  }

  // Fix 3: parameter type must be int to match Device.charge(int amount)
  @override
  void charge(int amount) {
    super.charge(amount);
  }
}

void main() {
  Phone p = Phone('Samsung', 80, '0788123456');
  p.charge(15);
  p.battery = 120; // refused: outside 0 to 100
  p.battery = 100; // accepted: valid battery level
  p.status();
}
