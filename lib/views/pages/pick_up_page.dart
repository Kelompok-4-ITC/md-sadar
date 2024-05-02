import 'package:flutter/material.dart';
import 'package:sadar_app/models/barang_bekas_model.dart';
import 'package:sadar_app/models/sampah_daur_ulang_model.dart';
import 'package:sadar_app/views/pages/check_data_page.dart';
import 'package:sadar_app/views/widget/card_data_barang_component.dart';
import 'package:sadar_app/views/widget/scaffold_custom.dart';

class PickUpPage extends StatelessWidget {
  const PickUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.defaultScaffold(
      context: context,
      label: 'Pick Up',
      content: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'List Sampah Daur Ulang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Silahkan berikan detail Sampahmu!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 10),
                const _CardSampahDaurUlang(),
                const Text(
                  'List Barang Bekas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Silahkan berikan detail Barang Bekasmu!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 10),
                const _CardBarangBekas(),
                const SizedBox(height: 5),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckDataPage(
                            isPickUp: true,
                          ),
                        ),
                      );
                    },
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Ink(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF54BB8D),
                      ),
                      child: const Text(
                        "Lanjut",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CardSampahDaurUlang extends StatefulWidget {
  const _CardSampahDaurUlang({super.key});

  @override
  State<_CardSampahDaurUlang> createState() => __CardSampahDaurUlangState();
}

class __CardSampahDaurUlangState extends State<_CardSampahDaurUlang> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        SampahDaurUlangModel.itemDaurUlang.length,
        (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListSampahDaurUlangCard(
                isCheckPage: false,
                index: index,
                onChanged: (value) {
                  SampahDaurUlangModel.itemDaurUlang[index].detailSampah =
                      value;
                },
                addMore: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    SampahDaurUlangModel.itemDaurUlang.add(
                      SampahDaurUlangModel(
                        kategoriSampah: 'Pilih Kategori Sampah',
                        detailSampah: '',
                      ),
                    );
                  });
                },
                delete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    SampahDaurUlangModel.itemDaurUlang.removeAt(index);
                  });
                },
              ),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
    );
  }
}

class _CardBarangBekas extends StatefulWidget {
  const _CardBarangBekas({super.key});

  @override
  State<_CardBarangBekas> createState() => __CardBarangBekasState();
}

class __CardBarangBekasState extends State<_CardBarangBekas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        BarangBekasModel.itemDaurUlang.length,
        (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListBarangBekasCard(
                isCheckedPage: false,
                index: index,
                onChangedName: (value) {
                  BarangBekasModel.itemDaurUlang[index].namaBarang = value;
                },
                onChangedPrice: (value) {
                  BarangBekasModel.itemDaurUlang[index].hargaJual =
                      double.parse(value);
                },
                onChangedDesc: (value) {
                  BarangBekasModel.itemDaurUlang[index].descBarang = value;
                },
                addMore: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    BarangBekasModel.itemDaurUlang.add(
                      BarangBekasModel(
                        namaBarang: '',
                        hargaJual: 0,
                        descBarang: '',
                      ),
                    );
                  });
                },
                delete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    BarangBekasModel.itemDaurUlang.removeAt(index);
                  });
                },
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
