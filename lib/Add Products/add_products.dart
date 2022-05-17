

class Product {

  final String purchase_cost;
  final String item;
  final int qty;
  Product({required this.purchase_cost, required this.item,required this.qty});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      purchase_cost: json['purchase_cost'],
      item : json['name'],
      qty: json['qty']
    );
  }
}
