import 'package:flutter/cupertino.dart';

class User {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;

  User({ this.uid, this.lastName, this.firstName, this.email });

  @override
  String toString() {
    print('UserModel $uid');
    return this.uid;
  }

  static User of(BuildContext context) {
    final UserBinding binding = context.dependOnInheritedWidgetOfExactType<UserBinding>();
    return binding.userModel;
  }
}

//https://medium.com/flutter/managing-flutter-application-state-with-inheritedwidgets-1140452befe1
class UserBinding extends InheritedWidget {
  final User userModel;

  const UserBinding({
    Key key,
    this.userModel,
    Widget child,
  }) : assert(userModel != null), super(key: key, child: child);

  @override
  bool updateShouldNotify(UserBinding oldWidget) => userModel != oldWidget.userModel;
}

