import 'package:equatable/equatable.dart';

class UserManagement<T extends AdminUser> {
  final T adminUser;

  UserManagement(this.adminUser);
  void sayNameUser(GenericUser _user) {
    print(_user.name);
  }

  int CalculateMoney(List<GenericUser> _users) {
    int _sum = 0;
    for (GenericUser user in _users) {
      _sum += user.money;
    }

    final _sumMoney =
        _users.map((e) => e.money).toList().fold<int>(0, (previousValue, element) => previousValue + element);

    int initialValue = adminUser.role == 1 ? adminUser.money : 0;
    final _money = _users.fold<int>(initialValue, (previousValue, element) => previousValue + element.money);
    //return _sum;
    return _money;
  }

  Iterable<VBModel<R>>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => VBModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class VBModel<T> {
  final String name = 'vb';
  final List<T> items;

  VBModel(this.items);
}

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;
  GenericUser(
    this.name,
    this.id,
    this.money,
  );

  bool findUserName(String name) {
    //* this.name demek o an  bu fonksiyon hangi objede calıstıysa o objenin nameini al demek
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';

  @override
  // TODO: implement props
  List<Object?> get props => [id]; //* id popertyleri aynı olanları bir say demek
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(String name, String id, int money, this.role) : super(name, id, money);
}
