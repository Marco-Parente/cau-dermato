import 'package:cau_dermato/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';

// "Rua C-139 No 853 Sala 402 Medicorum Centro Clínico, Bairro Jardim América, Goiania-GO, CEP 74275-070"

const List<_DrawerItem> items = [];

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            duration: Duration(seconds: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                OutlineButton.icon(
                  icon: Icon(Icons.person),
                  label: Text("Logar"),
                  onPressed: () {},
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.face),
                    SizedBox(width: 10),
                    Icon(Icons.face),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}

// class _DrawerItem {

//   const _DrawerItem({});
// }

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget leadsTo;

  const _DrawerItem({
    Key key,
    this.title,
    this.icon,
    this.leadsTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => leadsTo ?? HomeScreen(),
          ),
        );
      },
    );
  }
}
