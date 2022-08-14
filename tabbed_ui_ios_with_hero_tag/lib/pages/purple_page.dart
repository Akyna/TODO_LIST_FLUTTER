import 'package:flutter/material.dart';
import 'package:tabbed_ui_ios_with_hero_tag/top_bar.dart';

class PurplePage extends StatelessWidget {
  const PurplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTopBar(
      text: "Purple Page",
      uniqueHeroTag: 'purplePage',
      style: const TextStyle(fontSize: 16),
      child: SafeArea(
        child: Container(
          color: Colors.deepPurple,
          child:  const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit quam non felis molestie, sed consequat purus elementum. Duis nec quam ac tellus elementum porttitor id ac dui. Sed sed dignissim enim. Sed eu ex sapien. Sed leo leo, molestie in diam quis, elementum commodo mi. Fusce nec bibendum eros. Quisque sagittis neque eget augue gravida sollicitudin. Nunc condimentum enim magna, sagittis pretium mi molestie non. Aliquam quis augue luctus ipsum venenatis interdum. Nam blandit enim diam, vitae ornare leo interdum ac. Nullam vulputate tempor purus eget vestibulum. Integer rhoncus congue sapien nec malesuada. Suspendisse dignissim et metus ac varius.

Fusce gravida vestibulum ornare. Aliquam scelerisque mauris ut ex pretium pulvinar. Quisque ut libero sem. In quis neque diam. Quisque placerat porta mi, sit amet lacinia enim venenatis ac. Vestibulum dui massa, maximus sit amet dolor id, pulvinar condimentum risus. Etiam nec cursus est, ac luctus quam. Pellentesque efficitur enim sed nulla consectetur auctor. Etiam at nulla eu turpis maximus dignissim sit amet nec lacus.

Cras a ex faucibus, convallis velit in, molestie urna. Donec sit amet lorem hendrerit, aliquam dolor sed, pellentesque lacus. Cras sodales ligula sit amet eros pretium dignissim. Phasellus porta molestie dolor eget condimentum. Phasellus quis lacinia urna, quis tempus odio. Ut vulputate rhoncus bibendum. Vestibulum at feugiat quam. Quisque a orci commodo diam aliquet congue. Quisque eget nunc porttitor, pretium dolor vitae, sollicitudin risus. Praesent convallis ultricies aliquam. Aliquam non neque at eros porta molestie. Vestibulum imperdiet aliquet tellus, in suscipit erat luctus vel. Nam accumsan lorem ac lobortis accumsan.

Cras pulvinar leo ut dui luctus fermentum ut vitae enim. Mauris quis urna felis. Integer blandit accumsan consectetur. Maecenas bibendum blandit tortor, quis vulputate ipsum lobortis vulputate. Praesent molestie accumsan mattis. Mauris tristique mi eget turpis vehicula, a tempor tortor feugiat. In bibendum aliquam luctus. Mauris aliquet justo eget suscipit ultrices.

Vivamus et dui eros. Aliquam quis ex et nulla consequat interdum nec ut nisl. Sed facilisis, lectus sed vulputate convallis, neque leo iaculis enim, ut dictum ipsum eros sit amet eros. Vestibulum molestie orci ut lacus ornare, sed cursus odio cursus. Maecenas in gravida neque. Integer mollis egestas malesuada. Duis luctus urna augue, vel volutpat urna viverra vel. Maecenas odio nibh, fringilla sed ex at, lacinia venenatis odio. Donec malesuada quam aliquam, vestibulum ipsum non, pellentesque est. Donec vulputate aliquam nulla, a mollis velit euismod at. Sed congue finibus est, eget varius enim pulvinar ut. Vivamus sed nunc urna. Suspendisse potenti. Phasellus scelerisque nunc et feugiat vestibulum.

Proin consectetur dolor vitae risus luctus, nec tincidunt ipsum accumsan. Proin dignissim placerat varius. Morbi ultricies, sem quis euismod condimentum, urna urna suscipit ex, rutrum vehicula turpis purus et felis. Nunc dui dui, faucibus at neque ut, aliquet posuere mi. Vestibulum tortor felis, auctor et hendrerit ut, ultrices quis nibh. Sed efficitur nibh sit amet tortor bibendum tristique. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus non libero varius ipsum tempus pharetra.

In ac tristique turpis, et tincidunt tortor. Aliquam sed nisi dui. Aenean vehicula purus nibh. Etiam dignissim purus est, eu porta erat dignissim quis. Integer mollis urna quam, at congue quam suscipit sit amet. Nullam faucibus commodo sapien, vitae suscipit nisi eleifend sit amet. In et sapien consequat, molestie erat vitae, consectetur odio. Cras tristique nunc ut lectus condimentum, eu mollis est ornare. Fusce eget tincidunt ex.

Integer sagittis sem ex, vel finibus purus eleifend in. Nulla non eleifend lacus, eget sodales ex. Nam lacinia id enim bibendum auctor. Vivamus dignissim metus sed neque luctus consequat. Praesent facilisis condimentum eros vel eleifend. Aenean vitae purus tellus. Phasellus eget finibus nisl. Curabitur imperdiet nisl eros, vel maximus nisl tincidunt convallis. Cras ut bibendum felis, vel venenatis leo. Donec a sapien et felis pharetra dapibus.

Nullam consectetur urna lacus, non tincidunt sapien egestas vel. Curabitur sit amet consequat mauris. Aliquam euismod dolor id turpis mattis, id bibendum ipsum pharetra. Phasellus elementum, felis in eleifend dictum, nunc orci cursus augue, ut feugiat risus urna sit amet sapien. Cras dictum augue lectus, in lobortis velit pretium vel. Etiam tincidunt erat vel metus suscipit, eu ullamcorper sem vulputate. Nulla orci tortor, accumsan non purus et, tristique ultrices mauris. Quisque eu molestie neque. Aenean pharetra diam sit amet erat vestibulum vestibulum. Pellentesque porttitor suscipit sem, ac volutpat nulla hendrerit aliquet. Donec ultricies est id eros malesuada, quis imperdiet augue ullamcorper. Phasellus laoreet urna mi, id dictum mauris finibus sollicitudin.

Nulla nisi dolor, tempus a malesuada sed, placerat sed neque. Sed dictum tempus ex a iaculis. Morbi mattis gravida turpis eu suscipit. Sed fermentum neque a justo blandit luctus. Etiam quis purus nec justo luctus tincidunt. Nam orci risus, efficitur sit amet nibh sit amet, ullamcorper mattis mauris. Proin et mauris in metus pellentesque euismod non quis libero. Ut vitae facilisis lacus, a suscipit arcu. Donec porttitor, urna vulputate semper finibus, velit metus bibendum dui, in elementum nulla dui sit amet nulla.
                """,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
