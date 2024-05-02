import 'package:flutter/material.dart';
import 'package:sadar_app/models/barang_bekas_model.dart';
import 'package:sadar_app/models/sampah_daur_ulang_model.dart';

class CustomScaffold {
  static Widget defaultScaffold({
    required BuildContext context,
    String? label,
    Widget? content,
    AppBar? customAppBar,
    bool canBack = true,
  }) {
    return Scaffold(
      appBar: label != null
          ? AppBar(
              leading: canBack
                  ? IconButton(
                      onPressed: () {
                        SampahDaurUlangModel.itemDaurUlang = [
                          SampahDaurUlangModel(
                            kategoriSampah: 'Pilih Kategori Sampah',
                            detailSampah: '',
                          ),
                        ];
                        BarangBekasModel.itemDaurUlang = [
                          BarangBekasModel(
                            namaBarang: '',
                            hargaJual: 0,
                            descBarang: '',
                          ),
                        ];
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        size: 35,
                      ),
                    )
                  : Container(),
              title: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            )
          : customAppBar,
      body: content,
    );
  }
}
