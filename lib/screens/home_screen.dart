import 'package:flutter/material.dart';
import '../models/test_item.dart';
import '../services/test_service.dart';
import '../widgets/test_item_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TestService _testService = TestService();
  late Future<List<TestItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _testService.fetchTestItems();
  }

  void _refresh() {
    setState(() {
      _itemsFuture = _testService.fetchTestItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Flutter Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: FutureBuilder<List<TestItem>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No test items found.'),
            );
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return TestItemTile(
                item: item,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on ${item.title}')),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
