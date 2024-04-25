import 'package:flutter/material.dart';
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
                CardDataBarangComponent.listBarangBekas(
                  isCheckedPage: false,
                  isFirstItem: false,
                ),
                const SizedBox(height: 15),
                CardDataBarangComponent.listBarangBekas(
                  isCheckedPage: false,
                  isFirstItem: false,
                ),
                const SizedBox(height: 15),
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
  final List<SampahDaurUlangModel> _itemDaurUlang = [
    SampahDaurUlangModel(
      kategoriSampah: '1',
      detailSampah: '1',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(_itemDaurUlang.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListBarangBekasCard(
              title: index.toString(),
              isCheckPage: false,
              isFirstItem: _itemDaurUlang.length == 1,
              addMore: () {
                setState(() {
                  _itemDaurUlang.add(
                    SampahDaurUlangModel(
                      kategoriSampah: '$index',
                      detailSampah: '$index',
                    ),
                  );
                });
              },
              delete: () {
                setState(() {
                  _itemDaurUlang.remove(
                    _itemDaurUlang.elementAt(index),
                  );
                });
              },
            ),
            const SizedBox(height: 15),
          ],
        );
      }),
    );
  }
}
