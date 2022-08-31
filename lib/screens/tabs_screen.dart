import 'package:flutter/material.dart';
import 'package:todo_app/screens/completed_task_screen.dart';
import 'package:todo_app/screens/favorite_task_screen.dart';
import 'package:todo_app/screens/my_drawer.dart';
import 'package:todo_app/screens/pending_screen.dart';

import 'add_task_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {
      'pageName': const PendingTaskScreen(),
      'title': 'Pending Tasks',
    },
    {
      'pageName': const CompletedTaskScreen(),
      'title': 'Completed Tasks',
    },
    {
      'pageName': const FavoriateTaskScreen(),
      'title': 'Favorite Tasks',
    }
  ];

  var _selectPageIndex = 0;

  // ignore: unused_element
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddStaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectPageIndex]['title']),
        actions: [
          IconButton(
              onPressed: () => _addTask(context), icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectPageIndex]['pageName'],
      floatingActionButton: _selectPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'And Add',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: (index) {
          setState(() {
            _selectPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp), label: 'Pending Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Task')
        ],
      ),
    );
  }
}
