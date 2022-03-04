import 'package:scoped_model/scoped_model.dart';

class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  int rating;

  Product(this.name, this.description, this.price, this.image, this.rating);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
      json['rating'],
    );
  }

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
        Product("Brave Enough", "Lindsey Stirling", 800, "braveenough.jpg", 0));
    items.add(Product("Starboy", "The Weeknd", 2000, "starboy.jpg", 0));
    items.add(Product("Kaleidoscope", "Coldplay", 1500, "kaleidoscope.jpg", 0));
    items.add(Product("What We Drew", "Yaeji", 100, "whatwedrew.jpg", 0));
    items.add(Product(
        "Future Nostalagia", "Dua Lipa", 20, "futurenostalagia.jpg", 0));
    return items;
  }

  void updateRating(int myRating) {
    rating = myRating;
    notifyListeners();
  }
}
