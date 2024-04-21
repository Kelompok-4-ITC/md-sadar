import 'package:flutter/material.dart';
import 'package:sadar_app/views/pages/news_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BoxShadow> _boxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      blurRadius: 3,
      offset: const Offset(-2, 2), // Shadow position
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/LogoSadar.png',
                        width: 34.66,
                        height: 31,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'SADAR',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.notifications_outlined,
                    size: 26,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: const _ImagesCarousel(),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * 2 / 3 - 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: Color(0xFFF3FFFA),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _listButton(
                                  name: 'Pick Up',
                                  urlImage:
                                      'https://static-00.iconduck.com/assets.00/delivery-car-icon-2048x1691-ibi7pyzo.png',
                                ),
                                _listButton(
                                  name: 'Drop Off',
                                  urlImage:
                                      'https://cdn-icons-png.freepik.com/256/1008/1008014.png?semt=ais_hybrid',
                                ),
                                _listButton(
                                  name: 'Shop',
                                  urlImage:
                                      'https://cdn-icons-png.flaticon.com/512/3443/3443338.png',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Berita Apa Hari Ini ?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                _listNews(title: 'Hari Sampah Sedunia'),
                                const SizedBox(height: 10),
                                _listNews(title: 'Hari Sampah Se Indonesia'),
                                const SizedBox(height: 10),
                                _listNews(title: 'Hari Sampah Se Yogyakarta'),
                                const SizedBox(height: 10),
                                _listNews(title: 'Hari Sampah Se Sleman'),
                                const SizedBox(height: 10),
                                _listNews(title: 'Hari Sampah Se Babarsari'),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listButton({required String name, required String urlImage}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFD9FFEE),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 3,
                offset: const Offset(-2, 2), // Shadow position
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              urlImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
          ),
        )
      ],
    );
  }

  Widget _listNews({required String title}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewsPage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: _boxShadow,
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7X14aWsgye-vdERQeqKzPp0QPnnklv597BJMVfX3XxQ&s',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    maxLines: 4,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagesCarousel extends StatefulWidget {
  const _ImagesCarousel({super.key});

  @override
  State<_ImagesCarousel> createState() => __ImagesCarouselState();
}

class __ImagesCarouselState extends State<_ImagesCarousel> {
  List<String> images = [
    "https://images.squarespace-cdn.com/content/v1/61c4da8eb1b30a201b9669f2/1696691175374-MJY4VWB1KS8NU3DE3JK1/Sounds-of-Nature.jpg",
    "https://natureconservancy-h.assetsadobe.com/is/image/content/dam/tnc/nature/en/photos/Zugpsitze_mountain.jpg?crop=0%2C176%2C3008%2C1654&wid=4000&hei=2200&scl=0.752",
    "https://cdn.unenvironment.org/styles/article_billboard_image/s3/2023-12/lake-1679708_1920.jpg?h=e9cfbfe5&itok=sOVz3Fv6",
  ];

  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: images.length,
          onPageChanged: (value) {
            setState(() {
              _activePage = value;
            });
          },
          itemBuilder: (context, index) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _indicators(_activePage),
          ),
        )
      ],
    );
  }

  List<Widget> _indicators(currentIndex) {
    return List<Widget>.generate(
      images.length,
      (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.black26,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
