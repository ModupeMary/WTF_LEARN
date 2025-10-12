abstract class Vehicle {
  String brand;
  int speed;

  //Constructor
  Vehicle(this.brand, this.speed);

  //abstract method
  void move();
}

mixin Electric {
  void chargeBattery() {
    print("Battery is 100% charged");
  }
}

mixin FuelPowered {
  void refuel() {
    print("Fuel Tank is full");
  }
}

class Car extends Vehicle with FuelPowered {
  Car(String brand, int speed) : super(brand, speed);

  @override
  void move() {
    print("The $brand Car is moving. Driving at $speed km/hr");
  }
}

class Bike extends Vehicle {
  Bike(String brand, int speed) : super(brand, speed);

  @override
  void move() {
    print("The $brand Bike is moving. Speeding at $speed km/hr");
  }
}

class ElectricScooter extends Vehicle with Electric {
  ElectricScooter(String brand, int speed) : super(brand, speed);

  @override
  void move() {
    print("The $brand Electric Scooter is moving. Riding at $speed km/hr");
  }
}

void main() {
  var brandCar = Car("Mercedes", 100);
  var brandBike = Bike("Bajaj", 45);
  var brandScooter = ElectricScooter("TVS", 60);

  //List of Vehicles
  List<Vehicle> vehicleTypes = [brandBike, brandScooter, brandCar];

  for (var Vehicle in vehicleTypes) {
    Vehicle.move();
    print('');
  }

  //Call the abstract method
  brandCar.move();
  brandBike.move();
  brandScooter.move();

  //Call the mixin method
  brandCar.refuel();
  brandScooter.chargeBattery();
}
