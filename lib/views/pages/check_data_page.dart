import 'package:flutter/material.dart';
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
                const Text(
                  'Total Barang : 2 Barang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 10),
                const ListBarangBekasCard(
                  isCheckPage: true,
                ),
                const SizedBox(height: 10),
                const ListBarangBekasCard(
                  isCheckPage: true,
                ),
                const SizedBox(height: 15),
                const Text(
                  'List Barang Bekas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 5),
                CardDataBarangComponent.listBarangBekas(isCheckedPage: true),
                const SizedBox(height: 10),
                CardDataBarangComponent.listBarangBekas(isCheckedPage: true),
                const SizedBox(height: 15),
                Material(
                  child: InkWell(
                    onTap: () {},
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
}
