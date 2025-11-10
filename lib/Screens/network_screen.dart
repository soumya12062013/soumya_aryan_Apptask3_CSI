import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNetworkScreen extends StatefulWidget {
   MyNetworkScreen({super.key});

  @override
  State<MyNetworkScreen> createState() => _MyNetworkScreenState();
}

enum NetworkTab { suggestions, connections }

class _MyNetworkScreenState extends State<MyNetworkScreen> {
  NetworkTab _currentTab = NetworkTab.suggestions;
  int _bottomIndex = 2;

  final TextEditingController _searchCtrl = TextEditingController();

  final List<Person> suggestions =  [
    Person(
      name: 'Alex Thompson',
      title: 'Senior Product Manager',
      company: 'Apple',
      mutualConnections: 12,
      avatarUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=300',
      isConnected: true,
    ),
    Person(
      name: 'Jessica Lee',
      title: 'UX Designer',
      company: 'Adobe',
      mutualConnections: 8,
      avatarUrl:
          'https://images.unsplash.com/photo-1583195763986-0231686dcd43?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=2076',
      isConnected: true,
    ),
    Person(
      name: 'Marcus Johnson',
      title: 'DevOps Engineer',
      company: 'Amazon',
      mutualConnections: 15,
      avatarUrl:
          'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?q=80&w=300',
      isConnected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final list = _currentTab == NetworkTab.suggestions ? suggestions : suggestions;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title:  Text(
          'My Network',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          // Search
          Padding(
            padding:  EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset:  Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchCtrl,
                decoration:  InputDecoration(
                  hintText: 'Search people...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          // Segmented control
          Padding(
            padding:  EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: CupertinoSegmentedControl<NetworkTab>(
              groupValue: _currentTab,
              padding:  EdgeInsets.all(4),
              children: {
                NetworkTab.suggestions: _buildSegment('Suggestions'),
                NetworkTab.connections:
                    _buildSegment('Connections (${suggestions.length})'),
              },
              onValueChanged: (val) => setState(() => _currentTab = val),
            ),
          ),

           SizedBox(height: 4),
          // List
          Expanded(
            child: ListView.separated(
              padding:  EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: list.length,
              separatorBuilder: (_, __) =>  SizedBox(height: 12),
              itemBuilder: (context, index) {
                final person = list[index];
                return _PersonCard(person: person);
              },
            ),
          ),
        ],
      ),

      // Bottom navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: _bottomIndex,
        onDestinationSelected: (i) => setState(() => _bottomIndex = i),
        destinations:  [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined
              ), 
              selectedIcon: Icon(
                Icons.home
                ), 
                label: 'Home'
                ),
          NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.people_alt_outlined), selectedIcon: Icon(Icons.people_alt), label: 'Network'),
          NavigationDestination(icon: Icon(Icons.mail_outline), selectedIcon: Icon(Icons.mail), label: 'Messages'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildSegment(String label) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        label,
        style:  TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _PersonCard extends StatelessWidget {
   _PersonCard({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(person.avatarUrl),
              backgroundColor:  Color(0xFFE6E6E6),
            ),
             SizedBox(width: 14),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                   SizedBox(height: 2),
                  Text(
                    person.title,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                   SizedBox(height: 2),
                  Text(
                    person.company,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                   SizedBox(height: 6),
                  Text(
                    '${person.mutualConnections} mutual connections',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            _ConnectedPill(
          person: person,
            onTap: () {
    person.isConnected = !person.isConnected;
    (context as Element).markNeedsBuild(); // refresh UI
  },
),
          ],
        ),
      ),
    );
  }
}

class _ConnectedPill extends StatelessWidget {
   _ConnectedPill({
    required this.person,
    required this.onTap,
  });

  final Person person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isConnected = person.isConnected;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isConnected ? Colors.black : Colors.white,
          border: Border.all(
            color: isConnected ? Colors.black : Colors.grey.shade400,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isConnected ? Icons.check : Icons.person_add_alt,
              size: 18,
              color: isConnected ? Colors.white : Colors.black,
            ),
             SizedBox(width: 6),
            Text(
              isConnected ? "Connected" : "Connect",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isConnected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Person {
  final String name;
  final String title;
  final String company;
  final int mutualConnections;
  final String avatarUrl;
   bool isConnected;

   Person({
    required this.name,
    required this.title,
    required this.company,
    required this.mutualConnections,
    required this.avatarUrl,
     this.isConnected=false,
  });
}