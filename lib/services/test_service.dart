import '../models/test_item.dart';

class TestService {
  Future<List<TestItem>> fetchTestItems() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return const [
      TestItem(id: '1', title: 'Test Item Alpha', description: 'This is the description for alpha.'),
      TestItem(id: '2', title: 'Test Item Beta', description: 'This is the description for beta.'),
      TestItem(id: '3', title: 'Test Item Gamma', description: 'This is the description for gamma.'),
    ];
  }
}
