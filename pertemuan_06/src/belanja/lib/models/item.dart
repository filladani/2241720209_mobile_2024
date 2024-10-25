// class Item {
//   final String name;
//   final double price;
//   final String imageUrl; // Atribut untuk foto produk
//   final int stock; // Atribut untuk stok
//   final double rating; // Atribut untuk rating

//   Item({
//     required this.name,
//     required this.price,
//     required this.imageUrl,
//     required this.stock,
//     required this.rating,
//   });
// }

class Item {
  String name, foto;
  int price, stok, rating;

  Item(
      {required this.name,
      required this.price,
      required this.stok,
      required this.rating,
      required this.foto});
}
