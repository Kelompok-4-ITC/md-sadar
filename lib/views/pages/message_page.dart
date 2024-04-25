import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sadar_app/models/chat_message_model.dart';
import 'package:sadar_app/views/widget/scaffold_custom.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.defaultScaffold(
      context: context,
      customAppBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 45,
                  height: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://imge.com/wp-content/uploads/2016/04/Ethan-Eilon_.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Ronaldo",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.call,
                  color: Color(0xFF54BB8D),
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.more_vert,
                  color: Color(0xFF54BB8D),
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      content: const _ChatWidget(),
    );
  }
}

class _ChatWidget extends StatefulWidget {
  const _ChatWidget({super.key});

  @override
  State<_ChatWidget> createState() => __ChatWidgetState();
}

class __ChatWidgetState extends State<_ChatWidget> {
  List<ChatMessageModel> messages = [
    ChatMessageModel(
      content: 'Test',
      type: 'reciver',
      time: '20:00',
    ),
    ChatMessageModel(
      content: 'Halooo',
      type: 'sender',
      time: '20:00',
    ),
    ChatMessageModel(
      content: 'Sesuai aplikasi pak?',
      type: 'reciver',
      time: '20:01',
    ),
    ChatMessageModel(
      content: 'Iya pak warna rumahnya hijau',
      type: 'sender',
      time: '20:01',
    ),
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            reverse: true,
            dragStartBehavior: DragStartBehavior.down,
            children: [
              for (ChatMessageModel i in messages.reversed)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: i.type == 'reciver'
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 3 / 4,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Color(0xFFA6FFD7),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          i.content,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        i.time,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          constraints: const BoxConstraints(
            maxHeight: 100,
            minHeight: 75,
          ),
          width: double.infinity,
          color: const Color(0xFFC0FFE3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: "Masukkan Pesan",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  maxLines: null,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Material(
                color: Colors.transparent,
                type: MaterialType.circle,
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        String time = DateFormat.Hm().format(DateTime.now());
                        messages.add(
                          ChatMessageModel(
                            content: _messageController.text,
                            type: 'sender',
                            time: time,
                          ),
                        );
                        _messageController.text = '';
                      });
                    }
                  },
                  child: Ink(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF54BB8D),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
