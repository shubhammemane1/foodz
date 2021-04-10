import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(BuildContext ctx ,IconData icon, String text, String path) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: (){
        Navigator.of(ctx).pushNamed(path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor.withOpacity(0.5),
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(context,
            Icons.restaurant,
            'Meals',
            '/',
          ),
          buildListTile(
            context,
            Icons.settings,
            'Filters',
            '/Filters-Screen',
          ),
        ],
      ),
    );
  }
}
