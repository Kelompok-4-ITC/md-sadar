import 'package:flutter/material.dart';
import 'package:sadar_app/views/widget/card_data_barang_component.dart';
import 'package:sadar_app/views/widget/scaffold_custom.dart';

class HistoryDetailPage extends StatelessWidget {
  final bool isPickUp;
  const HistoryDetailPage({super.key, required this.isPickUp});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.defaultScaffold(
      context: context,
      label: 'Detail Riwayat',
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF6EDDAC),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/66/66841.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      isPickUp ? 'Pick Up' : 'Drop Off',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Kode Pemesanan',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ABC123',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.location_pin,
                    color: Color(0xFF54BB8D),
                    size: 30,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isPickUp ? 'Alamat Penjemputan' : 'Alamat Dituju',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Pak Jhon - Jln. Babarsari',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Jalan Babarsari, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Barang : 2 Barang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 10),
                  ListSampahDaurUlangCard(
                    isCheckPage: true,
                  ),
                  SizedBox(height: 10),
                  ListSampahDaurUlangCard(
                    isCheckPage: true,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'List Barang Bekas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 5),
                  ListBarangBekasCard(isCheckedPage: true),
                  SizedBox(height: 10),
                  ListBarangBekasCard(isCheckedPage: true),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
