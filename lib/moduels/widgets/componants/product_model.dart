import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id, discount, reviewsNum;
  final Color color;
  bool isFavorite = false;
  final String? brand;
  final String status;
  final List<String>? sizes;
  final List<String> imageUrls;
  final String brandlogo;

  double? rating;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.id,
    required this.color,
    required this.isFavorite,
    required this.rating,
    required this.discount,
    required this.brand,
    required this.status,
    required this.imageUrls,
    this.sizes,
    required this.brandlogo,
    required this.reviewsNum,
  });
}

class Cart with ChangeNotifier {
  List<OrderItem> itemsInCart = [];

  double get totalCost {
    double total = 0;
    for (var item in itemsInCart) {
      total += item.product.price;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    // print(orderItem.product.name);
    itemsInCart.remove(orderItem);
    // print(t);
    notifyListeners();
  }
}

class OrderItem {
  Product product;

  /// Selected size of product; This can be null
  String? selectedSize;

  /// Selected color of product; This can be null
  String? selectedColor;

  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}

List<Product> products = [
  Product(
    id: 1,
    title: "Air Jordan",
    price: 234,
    size: 11,
    description: dummyText,
    image: "assets/products/product-1.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 25,
    brand: 'Nike',
    status: 'In Stock',
    imageUrls: [
      "assets/products/product-1.png",
      "assets/products/product-1.png",
      "assets/products/product-1.png",
      "assets/products/product-1.png",
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
    rating: 4.6,
    reviewsNum: 90,
  ),
  Product(
    id: 2,
    title: "leather Jacket",
    price: 234,
    size: 8,
    description: dummyText,
    image: "assets/products/leather_jacket_2.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 15,
    brand: 'H&M',
    status: 'Out of Stock',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/HM_logo_PNG5.png",
    rating: 3.7,
    reviewsNum: 55,
  ),
  Product(
    id: 3,
    title: "AirJOrdonOrange",
    price: 234,
    size: 10,
    description: dummyText,
    image: "assets/products/NikeAirJOrdonOrange.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: false,
    discount: 5,
    brand: 'Nike',
    status: 'In Stock',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
    rating: 4.7,
    reviewsNum: 86,
  ),
  Product(
    id: 4,
    title: "tracsuitblue",
    price: 234,
    size: 11,
    description: dummyText,
    image: "assets/products/tracksuit_blue.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 75,
    brand: 'Nike',
    status: 'Out of Stock',
    rating: 3,
    reviewsNum: 72,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
  ),
  Product(
    id: 5,
    title: "Tracksuit ",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/tracksuit_red.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: false,
    discount: 25,
    brand: 'Nike',
    status: 'In Stock',
    rating: 4.1,
    reviewsNum: 56,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
  ),
  Product(
    id: 6,
    title: "Nike Shose",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/nike-shoes.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 10,
    brand: 'Nike',
    status: 'Out of Stock',
    rating: 3.4,
    reviewsNum: 96,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
  ),
  Product(
    id: 7,
    title: "trcksuit_green",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/trcksuit_parrotgreen.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: false,
    discount: 10,
    brand: 'Nike',
    status: 'Out of Stock',
    rating: 4.7,
    reviewsNum: 86,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
  ),
  Product(
    id: 8,
    title: "Slipper",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/NikeAirJordonwhiteMagenta.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: false,
    brand: 'Abo HAMO',
    discount: 50,
    status: 'Out of Stock',
    rating: 4.7,
    reviewsNum: 86,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/za.png",
  ),
  Product(
    id: 9,
    title: "T-shirt",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/tshirt_blue_without_collar_front.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 10,
    brand: 'AL 3TBAA',
    status: 'In Stock',
    rating: 4.7,
    reviewsNum: 86,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/Tommy-Hilfiger-Logo-PNG15.png",
  ),
  Product(
    id: 10,
    title: "AIR JORDON",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/NikeAirJordonwhiteMagenta.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 15,
    brand: 'Souq AL Gomaa',
    status: 'In Stock',
    rating: 4.7,
    reviewsNum: 86,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/adidasPNG3.png",
  ),
];

String dummyText =
    "AHlaa clothes leek ya bashaa neetmanaa nkooon Aseadnaaa  hadratk f al market  beta3naa  w yaa raat  matg#ish tany w shokran";

List<Product> likedProduct = [
  Product(
    id: 1,
    title: "Air Jordan",
    price: 234,
    size: 11,
    description: dummyText,
    image: "assets/products/product-1.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 25,
    brand: 'Nike',
    status: 'In Stock',
    imageUrls: [
      "assets/products/product-1.png",
      "assets/products/product-1.png",
      "assets/products/product-1.png",
      "assets/products/product-1.png",
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
    rating: 4.6,
    reviewsNum: 90,
  ),
  Product(
    id: 2,
    title: "leather Jacket",
    price: 234,
    size: 8,
    description: dummyText,
    image: "assets/products/leather_jacket_2.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 15,
    brand: 'H&M',
    status: 'Out of Stock',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/HM_logo_PNG5.png",
    rating: 3.7,
    reviewsNum: 55,
  ),
  Product(
    id: 4,
    title: "tracsuitblue",
    price: 234,
    size: 11,
    description: dummyText,
    image: "assets/products/tracksuit_blue.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 75,
    brand: 'Nike',
    status: 'Out of Stock',
    rating: 3,
    reviewsNum: 72,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
  ),
  Product(
    id: 6,
    title: "Nike Shose",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/nike-shoes.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 10,
    brand: 'Nike',
    status: 'Out of Stock',
    rating: 3.4,
    reviewsNum: 96,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/ni2.png",
  ),
  Product(
    id: 9,
    title: "T-shirt",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/tshirt_blue_without_collar_front.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 10,
    brand: 'AL 3TBAA',
    status: 'In Stock',
    rating: 4.7,
    reviewsNum: 86,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/Tommy-Hilfiger-Logo-PNG15.png",
  ),
  Product(
    id: 10,
    title: "AIR JORDON",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/NikeAirJordonwhiteMagenta.png",
    color: const Color.fromRGBO(235, 235, 235, 1),
    isFavorite: true,
    discount: 15,
    brand: 'Souq AL Gomaa',
    status: 'In Stock',
    rating: 4.7,
    reviewsNum: 86,
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
      'https://m.media-amazon.com/images/I/81KiSzLQMPL._AC_UX679_.jpg',
      'https://m.media-amazon.com/images/I/41KntIbaEzL._SX38_SY50_CR,0,0,38,50_.jpg',
      'https://m.media-amazon.com/images/I/41EZ6IoizRL._SX38_SY50_CR,0,0,38,50_.jpg',
    ],
    sizes: ['XS', 'S', 'M', 'L', 'XL'],
    brandlogo: "assets/adidasPNG3.png",
  ),
];
