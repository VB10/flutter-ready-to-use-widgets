import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.openDrawer,
    required this.isDrawerOpen,
  }) : super(key: key);
  final VoidCallback openDrawer;
  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Custom Drawer Example"),
          leading: Opacity(
            opacity: isDrawerOpen ? 0 : 1,
            child: IconButton(
              onPressed: () => openDrawer(),
              icon: const Icon(Icons.list),
            ),
          ),
        ),
        body: Opacity(
          opacity: isDrawerOpen ? 0.2 : 1,
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("Post Item $index"),
                    onTap: () {},
                  ),
                );
              }),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "a"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "b"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "c"),
        ]));
  }
}
