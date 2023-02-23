import 'package:base_flutter/data/remote/app_api.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import '../model/paging_response.dart';

abstract class HomeRepository {
  Future<Result<PagingResponse, dynamic>> getList(int page, String sort);
}

@Singleton(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  final AppApi api;

  HomeRepositoryImp({required this.api});
  
  @override
  Future<Result<PagingResponse, dynamic>> getList(int page, String sort) {
    return api.getList(page, sort);
  }

}
