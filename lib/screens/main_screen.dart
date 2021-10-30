import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int sideBarState = 1;
  int navTap = 0;

  double getWidth() {
    if (sideBarState == 0) {
      return 0;
    } else if (sideBarState == 1) {
      return 75;
    } else {
      return 250;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          SideBar(
            sideBarState: sideBarState,
            size: size,
            index: navTap,
            children: [
              SidebarIconButton(Icons.home_outlined, 'Home'),
              SidebarIconButton(Icons.list_alt, 'Manage Books'),
              SidebarIconButton(Icons.people_alt, 'Manage Users'),
              SidebarIconButton(Icons.list_alt, 'Requests'),
              SidebarIconButton(Icons.settings_outlined, 'Library Settings'),
              SidebarIconButton(
                  Icons.manage_accounts_outlined, 'Account Settings'),
            ],
            ontap: (i) {
              setState(() => navTap = i);
            },
          ),
          Positioned(
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width - getWidth(),
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        if (sideBarState < 2)
                          sideBarState++;
                        else
                          sideBarState = 0;
                      });
                    },
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                body: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar(
      {Key? key,
      required this.sideBarState,
      required this.size,
      required this.children,
      required this.index,
      this.ontap})
      : super(key: key);

  final int sideBarState;
  final Size size;
  final List<SidebarIconButton> children;
  final Function(int)? ontap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sideBarState == 2
              ? Container(
                  height: size.height / 5,
                  width: 55,
                  child: Icon(Icons.home_outlined, size: 150))
              : SizedBox(height: size.height / 5),
          Column(
            children: children
                .map((e) => Row(
                      children: [
                        Container(
                            width: 5,
                            height: 70,
                            color: index == children.indexOf(e)
                                ? Theme.of(context).accentColor
                                : null),
                        InkWell(
                          onTap: () {
                            ontap?.call(children.indexOf(e));
                          },
                          child: e,
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SidebarIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  SidebarIconButton(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
            SizedBox(width: 15),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
