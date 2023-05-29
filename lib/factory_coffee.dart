enum CoffeeType {Cappucino, American0, Latte}

abstract class Coffee{
  final int size;
  final String name;

  Coffee({required this.name, required this.size});

  factory Coffee.factory(CoffeeType coffeeType){

    switch (coffeeType){
      case CoffeeType.American0:
        return Americano('Americano', 3);
      case CoffeeType.Cappucino:
        return Cappucino('Capucino', 2, 1.5);
      case CoffeeType.Latte:
        return Latte('Latte', 2, 15);
      default:
        throw ArgumentError();
    }
  }

  double costCoffee();

  @override
  String toString() {
    return 'Coffee $name has size $size cm';
  }
}

class Cappucino extends Coffee {
  final double scalingFactor;

  Cappucino(String name, int size, this.scalingFactor)
      : super(name: name, size: size);

  @override
  double costCoffee() {
    return size * scalingFactor;
  }
}

class Americano extends Coffee {
  final int costPerMl = 2;

  Americano(String name, int size)
      : super(name: name, size: size);

  @override
  double costCoffee() {
    return (size * costPerMl).toDouble();
   }
  }


class Latte extends Coffee {
  final double cost;

  Latte(String name, int size, this.cost)
      : super(name: name, size: size);

  @override
  double costCoffee() {
    return cost;
  }
}



void main(){
  for(var value in CoffeeType.values){
    var coffee = Coffee.factory(value);
    print(coffee.toString() + ' with cost = ' + coffee.costCoffee().toString());
  }
}



