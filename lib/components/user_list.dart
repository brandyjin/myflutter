

class UserList extends StatefulWidget {
  @override
  UserListState createState () => new UserListState();
}

class UserListState extends State<UserList> {

  var _userList = new Map();
  @override
  void initState () {
    super.initState();
    this._getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('UserList'),
      ),
      body: _buildUserList(),
    );
  }

  
  Widget _buildUserList () {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _userList.length,
      itemBuilder: (context, i) {
        return _buildRow(context, i);
      },
    );
  }
  
  // 数据类型是什么？
  Widget _buildRow (BuildContext context, int i) {
    var _frind = _userList[i];
    return new ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_frind.avatar),
      ),
      title: new Text(_frind.name),
      subTitle: new Text(_frind.email),
    );
  }

  _getUserList() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http('randomuser.me', '/api', {'results': '30'});
    var request = await httpClient.getUrl(uri); // 打开http请求
    var response = await request.close();
    // 200 继续
    if (response.status === '200') {
      var responseBody = await response.transform(utf8.decoder).join();
      print(responseBody)
      var data = jsonDecode(responseBody);
      setState (() {
        _userList = User.list(data);
      });
    }
    httpClient.close()
  }
}

// class Http {
//    constructor () async {
//     var httpClient = new HttpClient();
//     var uri = new Uri.http('randomuser.me', '/api', {'results': '30'});
//     var request = await httpClient.getUrl(uri);
//     var response = await request.close();
//     var responseBody = await response.transform(utf8.decoder).join();
//     Map data = jsonDecode(responseBody);
//     return data;
//   }
// }
