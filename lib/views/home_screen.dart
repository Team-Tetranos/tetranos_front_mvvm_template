import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetranos_template/models/Post.dart';
import 'package:tetranos_template/view_models/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeViewModel>(
      builder: (context, hvm, _) {
        return Scaffold(
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
  }
}
