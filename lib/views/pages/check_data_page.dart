import 'package:flutter/material.dart';
import 'package:sadar_app/models/barang_bekas_model.dart';
import 'package:sadar_app/models/sampah_daur_ulang_model.dart';
import 'package:sadar_app/views/pages/finish_process_page.dart';
import 'package:sadar_app/views/widget/card_data_barang_component.dart';
import 'package:sadar_app/views/widget/scaffold_custom.dart';

class CheckDataPage extends StatelessWidget {
  final bool isPickUp;
  const CheckDataPage({super.key, required this.isPickUp});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.defaultScaffold(
      context: context,
      label: isPickUp ? 'Pick Up' : 'Drop Off',
      content: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.location_pin,
                        color: Color(0xFF54BB8D),
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alamat Penjemputan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Yusuf 081333148368',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Jalan Babarsari, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 3,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                Text(
                  'Total Barang : ${SampahDaurUlangModel.itemDaurUlang.length} Barang',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 10),
                _listDataSampahDaurUlang(),
                const SizedBox(height: 5),
                const Text(
                  'List Barang Bekas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 5),
                _listDataBarangBekas(),
                const SizedBox(height: 5),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinishProcessPage(
                            title: isPickUp ? 'Pick Up' : 'Drop Off',
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
                      child: Text(
                        isPickUp ? 'Proses Pesanan' : 'Berangkat',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
          ),
        ],
      ),
    );
  }

  Widget _listDataSampahDaurUlang() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        SampahDaurUlangModel.itemDaurUlang.length,
        (index) {
          return Column(
            children: [
              ListSampahDaurUlangCard(
                index: index,
                isCheckPage: true,
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  Widget _listDataBarangBekas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        BarangBekasModel.itemDaurUlang.length,
        (index) {
          return Column(
            children: [
              ListBarangBekasCard(
                index: index,
                isCheckedPage: true,
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
