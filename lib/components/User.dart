class User {
  @required final String avatar;
  @required final String name;
  @required final String email;
  
  // 构造函数，从外界传进来三个
  User({this.avatar, this.name, this.email});

  static Friend fromMap(Map map) {
    return new Friend({
      avatar: map['picture']['large'],
      name: map['name']['first'] + '' + map['name']['last'],
      email: map['email'],
    })
  }

  static List<Friend> list(Data data) {
    var { results } = data
    return results
      .map(item => Friend.fromMap(item))
      .toList()
      .cast<Friend>();
  }
}