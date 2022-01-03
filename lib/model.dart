class CarItem {
  final String title;
  final double price;
  final String path;
  final String gearbox;
  final String fuel;
  final String brand;

  CarItem({
    required this.title,
    required this.price,
    required this.path,
    required this.gearbox,
    required this.fuel,
    required this.brand,
  });
}

class CarList {
  List<CarItem> cars;
  CarList({required this.cars});
}

class BarangItem {
  final String title;
  final double price;
  final String path;
  final String brand;

  BarangItem({
    required this.title,
    required this.price,
    required this.path,
    required this.brand,
  });
}

class BarangList {
  List<BarangItem> barang;
  BarangList({required this.barang});
}