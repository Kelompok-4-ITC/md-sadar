import 'package:flutter/material.dart';
import 'package:sadar_app/views/widget/scaffold_custom.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.defaultScaffold(
      context: context,
      label: 'Berita',
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7X14aWsgye-vdERQeqKzPp0QPnnklv597BJMVfX3XxQ&s',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Hari Sampah Seduia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '''
          Lorem ipsum dolor sit amet consectetur. Nibh faucibus ut viverra maecenas pellentesque maecenas. Tincidunt quis sollicitudin amet lorem netus varius. At luctus tristique massa felis. Imperdiet mi in duis ut sed blandit orci eget eu. Lectus adipiscing lacus quis at iaculis lorem gravida. Mollis sodales enim sit pulvinar nunc morbi nunc dui eros. Elementum metus nibh tortor elit vel. Amet sociis nunc venenatis vitae pulvinar ut molestie sapien venenatis. Sit lorem mauris facilisis arcu massa tortor. Ac amet magna vivamus nisl sollicitudin faucibus consectetur.
          
          Cras facilisi mauris etiam ullamcorper curabitur vulputate sociis et. Sodales fermentum lacus massa amet ac tincidunt elit. Sociis neque sit ut dignissim nec. Eros sed in a elementum non fermentum a gravida in. Faucibus pellentesque quis est viverra aenean. Elementum id cursus eu aenean commodo condimentum sagittis porta.
          A ullamcorper nam sed in donec amet. Non accumsan suspendisse morbi et sed diam. Platea nec curabitur nullam sit pellentesque. Rutrum penatibus facilisis adipiscing nibh sagittis semper cursus eu. Mauris sodales pharetra turpis mauris at quis quis morbi tincidunt.
          
          Odio et condimentum ipsum tortor. Diam adipiscing duis nullam egestas elementum proin. Adipiscing semper nec consectetur pellentesque nunc diam turpis leo. Nulla dignissim imperdiet tortor mi proin purus. Donec enim amet eget suscipit. Sit tristique egestas sit cursus phasellus venenatis sed turpis massa. Quis commodo pretium fermentum blandit adipiscing nunc lorem iaculis. Diam vitae nulla vestibulum amet et. Velit mi pretium enim proin netus iaculis. Sit eleifend amet eget tristique et mi. 
          
          Quisque ac nunc nibh iaculis adipiscing mus. Sed sed in diam est sit luctus varius sit cum. Mauris odio aliquet ultricies placerat. Sapien commodo cursus ac ultrices. Quam consectetur consequat lectus et metus et.
          
          Orci quisque suspendisse lorem sit mi sit sed. Orci adipiscing at lacinia egestas quam at. Dui sit fames tempor donec maecenas interdum mattis congue arcu. Ut adipiscing orci elementum id lacinia sed suscipit. Pharetra eu maecenas adipiscing euismod. Leo egestas in quis porttitor fusce urna facilisi pretium enim. Faucibus ut morbi sit eu aenean fermentum tellus risus mi. Tempor nulla sed etiam tincidunt venenatis.
                ''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
