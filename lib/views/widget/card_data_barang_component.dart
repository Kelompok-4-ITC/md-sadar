import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadar_app/models/barang_bekas_model.dart';
import 'package:sadar_app/models/sampah_daur_ulang_model.dart';

class ListBarangBekasCard extends StatefulWidget {
  final bool isCheckedPage;
  final int index;
  final bool isFirstItem;
  final Function()? addMore;
  final Function()? delete;
  final Function(String value)? onChangedName;
  final Function(String value)? onChangedPrice;
  final Function(String value)? onChangedDesc;
  const ListBarangBekasCard({
    super.key,
    required this.isCheckedPage,
    this.index = 0,
    this.isFirstItem = true,
    this.addMore,
    this.delete,
    this.onChangedName,
    this.onChangedPrice,
    this.onChangedDesc,
  });

  @override
  State<ListBarangBekasCard> createState() => _ListBarangBekasCardState();
}

class _ListBarangBekasCardState extends State<ListBarangBekasCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF9F7F7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 3,
            offset: const Offset(-1, 2), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: !widget.isCheckedPage
                      ? () async {
                          await pickImage();
                        }
                      : () {},
                  child: Ink(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF6EDDAC),
                    ),
                    child: BarangBekasModel
                                .itemDaurUlang[widget.index].imagesUrl !=
                            null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: !kIsWeb
                                ? Image.file(
                                    BarangBekasModel
                                        .itemDaurUlang[widget.index].imagesUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    BarangBekasModel.itemDaurUlang[widget.index]
                                        .imagesUrl!.path,
                                    fit: BoxFit.cover,
                                  ),
                          )
                        : const Icon(
                            Icons.add_a_photo,
                            size: 50,
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Nama Barang',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: TextEditingController(
                        text: BarangBekasModel
                            .itemDaurUlang[widget.index].namaBarang,
                      ),
                      onChanged: widget.onChangedName,
                      enabled: !widget.isCheckedPage,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFD9FFEE),
                        hintText: 'Masukkan Nama Barang',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Harga Jual',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: TextEditingController(
                          text: BarangBekasModel
                              .itemDaurUlang[widget.index].hargaJual
                              .toString()),
                      onChanged: widget.onChangedPrice,
                      enabled: !widget.isCheckedPage,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFD9FFEE),
                        hintText: 'Masukkan Harga Jual',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          const Text(
            'Deskripsi Barang',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: TextEditingController(
              text: BarangBekasModel.itemDaurUlang[widget.index].descBarang,
            ),
            onChanged: widget.onChangedDesc,
            enabled: !widget.isCheckedPage,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            minLines: 1,
            maxLines: 5,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: const Color(0xFFD9FFEE),
              hintText: 'Masukkan Deskripsi Barang',
            ),
          ),
          widget.isCheckedPage
              ? Container(
                  height: 0,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: widget.addMore,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54BB8D),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        child: Text(
                          'Tambah Lagi',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    BarangBekasModel.itemDaurUlang.length == 1
                        ? Container(
                            height: 0,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 5),
                              ElevatedButton(
                                onPressed: widget.delete,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    'Hapus',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
        ],
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageTemp = File(image.path);
      setState(() {
        BarangBekasModel.itemDaurUlang[widget.index].imagesUrl = imageTemp;
      });
    }
  }
}

class ListSampahDaurUlangCard extends StatefulWidget {
  final bool isCheckPage;
  final int index;
  final Function()? addMore;
  final Function()? delete;
  final Function(String value)? onChanged;
  const ListSampahDaurUlangCard({
    super.key,
    required this.isCheckPage,
    this.index = 0,
    this.addMore,
    this.delete,
    this.onChanged,
  });

  static String listValue = 'Pilih Kategori Sampah';

  @override
  State<ListSampahDaurUlangCard> createState() =>
      _ListSampahDaurUlangCardState();
}

class _ListSampahDaurUlangCardState extends State<ListSampahDaurUlangCard> {
  bool showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF9F7F7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 3,
            offset: const Offset(-1, 2), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF6EDDAC),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/e/e3/Recycling_sign.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFF6EDDAC),
                      ),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Positioned(
                            child: GestureDetector(
                              onTap: widget.isCheckPage
                                  ? () {}
                                  : () {
                                      setState(() {
                                        showDetail = !showDetail;
                                      });
                                    },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xFF54BB8D),
                                ),
                                child: Icon(
                                  showDetail
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 35),
                              child: Text(
                                SampahDaurUlangModel
                                    .itemDaurUlang[widget.index].kategoriSampah,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF19553A),
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    showDetail
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF6EDDAC),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Kategori Sampah',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF19553A),
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: [
                                    listType('Plastik'),
                                    listType('Kaca'),
                                    listType('Kaleng'),
                                    listType('Barang Elektronik'),
                                    listType('Kardus'),
                                    listType('Lain-lain'),
                                  ],
                                )
                              ],
                            ),
                          )
                        : Container(
                            height: 0,
                          ),
                    TextField(
                      controller: TextEditingController(
                        text: SampahDaurUlangModel
                            .itemDaurUlang[widget.index].detailSampah,
                      ),
                      enabled: !widget.isCheckPage,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      minLines: 1,
                      maxLines: 5,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFD9FFEE),
                        hintText: 'Catatan detail sampahmu',
                      ),
                      onChanged: widget.onChanged,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          widget.isCheckPage
              ? Container(
                  height: 0,
                )
              : buttonItem(),
        ],
      ),
    );
  }

  Widget listType(String name) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            SampahDaurUlangModel.itemDaurUlang[widget.index].kategoriSampah =
                name;
            showDetail = false;
          });
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF19553A),
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF19553A),
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: widget.addMore,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF54BB8D),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            child: Text(
              'Tambah Lagi',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        SampahDaurUlangModel.itemDaurUlang.length == 1
            ? Container(
                height: 0,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: widget.delete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Text(
                        'Hapus',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
