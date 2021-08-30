
class Food {
  String makanan;
  String harga;
  String rating;
  String deskripsi;
  String bahan;
  String image;

  Food(this.makanan, this.harga, this.rating, this.deskripsi, this.bahan, this.image);

  Food.fromJson(Map<String, dynamic> json) {
    makanan = json['makanan'];
    harga = json['harga'];
    rating = json['rating'];
    deskripsi = json['deskripsi'];
    bahan = json['bahan'];
    image = json['image'];
  }
}