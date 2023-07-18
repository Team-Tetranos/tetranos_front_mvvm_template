import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetranos_template/models/Post.dart';
import 'package:tetranos_template/res/helper.dart';
import 'package:tetranos_template/view_models/home_view_model.dart';

import '../../dependency_injection/di.dart';
import '../../res/responsive_layout.dart';
import 'home_desktop.dart';
import 'home_mobile.dart';
import 'home_tablet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Helper helper = sl.get<Helper>();

  @override
  Widget build(BuildContext context) {

    return ResponsiveLayout(desktopBody: HomeDesktop(), tabletBody: HomeTablet(), mobileBody: HomeMobile());
  }
}

/*
* Consumer<HomeViewModel>(
      builder: (context, hvm, _) {
        return Scaffold(
          backgroundColor: helper.size.width<700?Colors.yellow:Colors.red,
          body: Center(
            child: Column(
              children: [


                TextButton(onPressed: (){

                    hvm.getPosts();

                }, child: Text("Hit")),

                if(hvm.posts.isEmpty)
                  Text("Checking Api Request")
                else
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: hvm.posts.length,
                      itemBuilder: (context, index){
                        Post post = hvm.posts[index];

                        return ListTile(
                          title: Text("${post.title}"),
                          subtitle: Text("${post.body}"),
                        );

                  },)

              ],
            ),
          ),
        );
      }
    );
*
* */
