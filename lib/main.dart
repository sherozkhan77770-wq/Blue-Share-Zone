
import 'package:flutter/material.dart';

void main() {
  runApp(const BlueShareZone());
}

class BlueShareZone extends StatelessWidget {
  const BlueShareZone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Share Zone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080B10),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1688FF),
          surface: Color(0xFF121923),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;

  final titles = ['Chats', 'Status', 'Calls'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blue Share Zone',
          style: TextStyle(
            color: Color(0xFF1688FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: [
          const ChatsPage(),
          const StatusPage(),
          const CallsPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (value) {
          setState(() => tab = value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.circle_outlined),
            label: 'Status',
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1688FF),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Nearby sharing will be added next!'),
            ),
          );
        },
        child: const Icon(Icons.bluetooth_searching),
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final names = ['Ali', 'Ahmed', 'Family Group', 'Usman'];

    return ListView(
      children: [
        for (final name in names)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF163D68),
              child: Text(name[0]),
            ),
            title: Text(name),
            subtitle: const Text('Welcome to Blue Share Zone'),
            trailing: const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF1688FF),
              size: 18,
            ),
            onTap: () {},
          ),
      ],
    );
  }
}

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          title: Text('My Status'),
          subtitle: Text('Add a status update'),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('Recent updates'),
        ),
      ],
    );
  }
}

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.call)),
          title: Text('Voice calls'),
          subtitle: Text('Your recent calls will appear here'),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.videocam)),
          title: Text('Video calls'),
          subtitle: Text('Call history'),
        ),
      ],
    );
  }
}
