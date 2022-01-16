import 'package:client/model/gencode/message_schema.pb.dart';

typedef AuthToken = String;

class SessionState {
    final AuthToken apiToken;
    final UserData user;

    SessionState(this.apiToken, this.user);
}
