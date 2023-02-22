import 'package:base_flutter/bloc/base_viewmodel.dart';
import 'package:base_flutter/repository/local_storage_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeViewModel extends BaseViewModel {
  final LocalStorageRepository local;

  HomeViewModel({required this.local});

  logOut() {
    local.removeAccessToken();
  }
}
