import 'dart:io';

class BarangBekasModel {
  String namaBarang;
  double hargaJual;
  String descBarang;
  File? imagesUrl;

  BarangBekasModel({
    required this.namaBarang,
    required this.hargaJual,
    required this.descBarang,
    this.imagesUrl,
  });

  static List<BarangBekasModel> itemDaurUlang = [
    BarangBekasModel(
      namaBarang: '',
      hargaJual: 0,
      descBarang: '',
    ),
  ];
}
