class FoodItem {
  final int id; //final ทำให้ไม่สามรถแก้ไขค่า อ่านได้อย่างเดียว
  final String name;
  final int price;
  final String image;

  FoodItem({  //from alt+insert
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  String toString() {
    return '$name ราคา $price บาท';
  }
}
