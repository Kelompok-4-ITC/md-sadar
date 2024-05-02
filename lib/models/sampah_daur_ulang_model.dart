class SampahDaurUlangModel {
  String kategoriSampah;
  String detailSampah;

  SampahDaurUlangModel({
    required this.kategoriSampah,
    required this.detailSampah,
  });

  static List<SampahDaurUlangModel> itemDaurUlang = [
    SampahDaurUlangModel(
      kategoriSampah: 'Pilih Kategori Sampah',
      detailSampah: '',
    ),
  ];
}
