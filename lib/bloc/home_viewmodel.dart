import 'package:base_flutter/repository/local_storage_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeViewModel {
  final LocalStorageRepository local;

  HomeViewModel({ required this.local });

  logOut() {
    local.removeAccessToken();
  }
}
