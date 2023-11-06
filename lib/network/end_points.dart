import 'package:navigator/network/deo_clint.dart';

enum Endpoints { login, UserList }

extension EndPointData on Endpoints {
  String path() {
    String path = "";
    switch (this) {
      case Endpoints.login:
        path = "api/login";
      case Endpoints.UserList:
        path = "api/users?page=2";
    }
    return path;
  }

  ReqType type() {
    ReqType type;
    switch (this) {
      case Endpoints.login:
        type = ReqType.POST;
      case Endpoints.UserList:
        type = ReqType.GET;
    }
    return type;
  }
}
