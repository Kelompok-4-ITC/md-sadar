import 'package:flutter/material.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Process',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF54BB8D),
                    ),
                    child: const Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: double.maxFinite,
              child: Text(
                'Semua proses yang sedang berlangsung menunggu langkah selanjutnya.',
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F7F7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pesanan Saya',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _listOption(
                                name: 'Semua',
                                color: const Color(0xFF54BB8D),
                              ),
                              _listOption(
                                name: 'Pick Up',
                                color: Colors.black,
                              ),
                              _listOption(
                                name: 'Drop Off',
                                color: Colors.black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          _listContent(code: 'ABC123', status: 'PICK UP'),
                          const SizedBox(height: 10),
                          _listContent(code: 'ABC456', status: 'DROP OFF'),
                          const SizedBox(height: 10),
                          _listContent(code: 'ABC789', status: 'PICK UP'),
                          const SizedBox(height: 10),
                          _listContent(code: 'EFG012', status: 'PICK UP'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _listOption({required String name, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 13,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15,
          color: color,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  Widget _listContent({required String code, required String status}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: const Color(0xFF54BB8D),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(-2, 0), // Shadow position
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kode Pemesanan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    code,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFEBFBEE),
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: Color(0xFF2AB445)),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: const Color(0xFFF3FFFA),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 3,
                offset: const Offset(-2, 1), // Shadow position
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/004/581/260/non_2x/truck-delivery-icon-transportation-automotive-shipping-moving-and-freight-illustration-design-free-vector.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                status,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
