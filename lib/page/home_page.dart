// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistema_peccioli_2/repository/repositories.dart';
import 'package:sistema_peccioli_2/widgets/home_widget.dart';

import 'menu_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<Repository>().getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 14,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => menuPage(),
                ),
              );
            },
            icon: Icon(Icons.menu_outlined),
            iconSize: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert_outlined),
              iconSize: 30,
            ),
          ],
          backgroundColor: Colors.red.shade300,
          title: Text(
            "Sistema Peccioli",
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            const HomeWidget(),
            Text('2'),
            Text('3'),
            Text('4'),
            Text('5'),
            Text('6'),
            Text('7'),
            Text('8'),
            Text('9'),
            Text('10'),
            Text('11'),
            Text('12'),
            Text('13'),
            Text('14'),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: TabBar(
            padding: EdgeInsets.zero,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.red.shade300,
            ),
            unselectedLabelColor: Colors.red.shade300,
            labelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                child: Text('Home'),
              ),
              Tab(
                icon: Icon(
                  Icons.campaign_sharp,
                  size: 30,
                ),
                child: Text('Novità'),
              ),
              Tab(
                icon: Icon(
                  Icons.event_available_outlined,
                  size: 30,
                ),
                child: Text('Eventi'),
              ),
              Tab(
                icon: Icon(
                  Icons.work_outline,
                  size: 30,
                ),
                child: Text('Turismo'),
              ),
              Tab(
                icon: Icon(
                  Icons.piano_outlined,
                  size: 30,
                ),
                child: Text('Attività'),
              ),
              Tab(
                icon: Icon(
                  Icons.color_lens_sharp,
                  size: 30,
                ),
                child: Text('Macca'),
              ),
              Tab(
                icon: Icon(
                  Icons.warning_amber,
                  size: 30,
                ),
                child: Text('Segnalazioni'),
              ),
              Tab(
                icon: Icon(
                  Icons.mouse_outlined,
                  size: 30,
                ),
                child: Text('Servizi On-line'),
              ),
              Tab(
                icon: Icon(
                  Icons.auto_stories_sharp,
                  size: 30,
                ),
                child: Text('Scuola'),
              ),
              Tab(
                icon: Icon(
                  Icons.recycling_outlined,
                  size: 30,
                ),
                child: Text('Ingombranti'),
              ),
              Tab(
                icon: Icon(
                  Icons.account_balance,
                  size: 30,
                ),
                child: Text('Il Comune'),
              ),
              Tab(
                icon: Icon(
                  Icons.pages_outlined,
                  size: 30,
                ),
                child: Text('Associazioni'),
              ),
              Tab(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
                child: Text('Galleria'),
              ),
              Tab(
                icon: Icon(
                  Icons.lock_outline,
                  size: 30,
                ),
                child: Text('Area Riservata'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabWidget extends StatelessWidget {
  final String label;
  final IconData icon;

  const _TabWidget({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(
        icon,
        size: 30,
      ),
      child: Text(
        label,
        style: TextStyle(),
      ),
    );
  }
}
