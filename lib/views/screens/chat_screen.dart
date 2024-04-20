import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
        color: Colors.white,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chatting',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Icon(
                  Icons.more_vert,
                )
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: const Color(0xFFD9FFEE),
                hintText: 'Cari',
                suffixIcon: const Icon(
                  Icons.search,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _userMassege(
                      context: context,
                      userName: 'Lorem',
                      content: 'OTW Lur',
                      date: '19:00'),
                  const SizedBox(height: 10),
                  _userMassege(
                      context: context,
                      userName: 'Ipsum',
                      content: 'Posisi dimana mas?',
                      date: '07:00'),
                  const SizedBox(height: 10),
                  _userMassege(
                      context: context,
                      userName: 'Kiki',
                      content: 'Saya otw, apakah ada petunjuk arahnya ya?',
                      date: '28/04/2024'),
                  const SizedBox(height: 10),
                  _userMassege(
                      context: context,
                      userName: 'Ronaldo',
                      content:
                          'Barang sudah diangkut, boleh minta bintang 5 nya?',
                      date: '23/04/2024'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userMassege(
      {required BuildContext context,
      required String userName,
      required String content,
      required String date}) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: 0,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://imge.com/wp-content/uploads/2016/04/Ethan-Eilon_.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 55,
                child: Container(
                  width: MediaQuery.of(context).size.width - 200,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        content,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: const Color(0xFF8899A6),
        )
      ],
    );
  }
}
