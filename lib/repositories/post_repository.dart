import 'package:tetranos_template/data/remote/service/base_api_service.dart';
import 'package:tetranos_template/data/remote/service/network_api_service.dart';
import 'package:tetranos_template/models/Post.dart';
import 'package:tetranos_template/res/Api/api_client.dart';
import 'package:tetranos_template/res/endpoints.dart';

import '../dependency_injection/di.dart';

class PostRepository{
  ApiService apiService = sl.get<ApiService>();
  ApiClient apiClient = sl.get<ApiClient>();
  EndPoints endPoints = sl.get<EndPoints>();
  Future<List<Post>>getAllPost()async{
    try{
      List<Post> posts = [];
      dynamic responseData = await apiService.getApiResponse(apiClient.rootUrl+endPoints.all_posts);
      Iterable allPostsIterable = responseData;
      for (var element in allPostsIterable) {

        posts.add(Post.fromJson(element));

      }
      return posts;
    }catch(e){
      throw e;
    }
  }
}