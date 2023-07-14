import 'package:flutter/foundation.dart';
import 'package:tetranos_template/models/Post.dart';
import 'package:tetranos_template/repositories/post_repository.dart';

class HomeViewModel with ChangeNotifier{
  PostRepository postRepository = PostRepository();
  List<Post> posts = [];

  getPosts()async{

    postRepository.getAllPost().then((value) {
      posts = value;
      notifyListeners();
    }).onError((error, stackTrace) {

    });

  }

}