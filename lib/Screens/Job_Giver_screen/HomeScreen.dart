// import 'package:flutter/material.dart';
// import 'package:internshala/Widget/BottomNavBar.dart';

// final List<Widget> _pages = [
//   const Center(child: Text('Home Page Content')),
//   const Center(child: Text('Jobs Page Content')),
//   const Center(child: Text('Chat Page Content')),
//   const Center(child: Text('Profile Page Content')),
// ];

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//   void _onTabSelected(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('My App')),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigation(
//         currentIndex: _currentIndex,
//         onTabSelected: _onTabSelected,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// User Model
class User {
  final String name;
  final String role; // 'seeker' or 'employer'
  User({required this.name, required this.role});
}

// Job Model
class Job {
  final String id;
  final String title;
  final String company;
  final String logo;
  final String location;
  final String type;
  final String salary;
  final String posted;
  final String description;
  final List<String> requirements;
  final int applicants;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.logo,
    required this.location,
    required this.type,
    required this.salary,
    required this.posted,
    required this.description,
    required this.requirements,
    required this.applicants,
  });
}

// Post Model
class Post {
  final String id;
  final String authorName;
  final String authorAvatar;
  final String authorTitle;
  final String authorCompany;
  final String content;
  final String? image;
  final int likes;
  final int comments;
  final int shares;
  final String timestamp;

  Post({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.authorTitle,
    required this.authorCompany,
    required this.content,
    this.image,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.timestamp,
  });
}

class HomeScreen extends StatefulWidget {
  //final User currentUser;
  //  const HomeScreen({super.key, required this.currentUser});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Set<String> savedJobs = {};
  Set<String> likedPosts = {};

  List<Job> mockJobs = [
    Job(
      id: '1',
      title: 'Senior React Developer',
      company: 'Google',
      logo:
          'https://images.unsplash.com/photo-1573804633927-bfcbcd909acd?w=100&h=100&fit=crop',
      location: 'Mountain View, CA',
      type: 'Full-time',
      salary: '\$120k - \$180k',
      posted: '2 days ago',
      description: 'Experienced React developer to build amazing UIs.',
      requirements: ['React', 'TypeScript', 'Redux', 'Testing'],
      applicants: 45,
    ),
    Job(
      id: '2',
      title: 'Product Designer',
      company: 'Airbnb',
      logo:
          'https://images.unsplash.com/photo-1549923746-c502d488b3ea?w=100&h=100&fit=crop',
      location: 'San Francisco, CA',
      type: 'Full-time',
      salary: '\$110k - \$160k',
      posted: '1 day ago',
      description: 'Join our design team to create intuitive experiences.',
      requirements: ['Figma', 'UI/UX', 'Research'],
      applicants: 67,
    ),
  ];

  List<Post> mockPosts = [
    Post(
      id: '1',
      authorName: 'Alex Chen',
      authorAvatar:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop',
      authorTitle: 'Tech Recruiter',
      authorCompany: 'Microsoft',
      content:
          "🚀 Exciting news! We're hiring 50+ engineers. Passionate about AI? Drop your resume!",
      likes: 234,
      comments: 45,
      shares: 12,
      timestamp: '3h ago',
    ),
    Post(
      id: '2',
      authorName: 'Maria Garcia',
      authorAvatar:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop',
      authorTitle: 'Senior Software Engineer',
      authorCompany: 'Meta',
      content:
          'Just finished an interview workshop! Here are my top 5 tips for acing technical interviews...',
      image:
          'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600&h=400&fit=crop',
      likes: 567,
      comments: 89,
      shares: 34,
      timestamp: '5h ago',
    ),
  ];

  void toggleSaveJob(String id) {
    setState(() {
      if (savedJobs.contains(id)) {
        savedJobs.remove(id);
      } else {
        savedJobs.add(id);
      }
    });
  }

  void toggleLikePost(String id) {
    setState(() {
      if (likedPosts.contains(id)) {
        likedPosts.remove(id);
      } else {
        likedPosts.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = widget.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 1,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  // Text(user.name,
                  //     style: const TextStyle(
                  //         color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black87,
                      ),
                      onPressed: () {},
                    ),
                    const Positioned(
                      right: 12,
                      top: 12,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // SliverToBoxAdapter(
            //   child: user.role == 'seeker'
            //       ? _buildSeekerView()
            //       : _buildEmployerDashboard(),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeekerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Recommended Jobs
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recommended Jobs",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              TextButton(onPressed: () {}, child: const Text("View All")),
            ],
          ),
        ),
        ...mockJobs.map((job) => _buildJobCard(job)).toList(),

        const SizedBox(height: 24),

        // Feed
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.white,
          width: double.infinity,
          child: const Text(
            "Network Feed",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        ...mockPosts.map((post) => _buildFeedPost(post)).toList(),
      ],
    );
  }

  Widget _buildEmployerDashboard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Stats Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildStatCard("Active Jobs", "12"),
              _buildStatCard("Applications", "234"),
              _buildStatCard("Interviews", "18"),
              _buildStatCard("Hired", "5"),
            ],
          ),
          const SizedBox(height: 20),

          // Recent Applications
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    "Recent Applications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(height: 1),
                _buildApplicantRow(
                  "Emma Wilson",
                  "Senior React Developer",
                  "https://images.unsplash.com/photo-1500648767791-c0a3a7e8e4ce?w=50&h=50&fit=crop",
                ),
                _buildApplicantRow(
                  "David Chen",
                  "Product Designer",
                  "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50&h=50&fit=crop",
                ),
                _buildApplicantRow(
                  "Sarah Miller",
                  "Backend Engineer",
                  "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=50&h=50&fit=crop",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(Job job) {
    final isSaved = savedJobs.contains(job.id);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(job.logo)),
        title: Text(
          job.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${job.company} • ${job.location}\n${job.salary}'),
        isThreeLine: true,
        trailing: IconButton(
          icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
          color: isSaved ? Colors.blue : Colors.grey,
          onPressed: () => toggleSaveJob(job.id),
        ),
      ),
    );
  }

  Widget _buildFeedPost(Post post) {
    final isLiked = likedPosts.contains(post.id);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(post.authorAvatar),
              ),
              title: Text(
                post.authorName,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('${post.authorTitle} • ${post.authorCompany}'),
              trailing: Text(
                post.timestamp,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 8),
            Text(post.content),
            if (post.image != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(post.image!, fit: BoxFit.cover),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                  color: isLiked ? Colors.red : Colors.grey,
                  onPressed: () => toggleLikePost(post.id),
                ),
                Text('${post.likes}'),
                const SizedBox(width: 16),
                const Icon(Icons.comment_outlined, size: 20),
                const SizedBox(width: 4),
                Text('${post.comments}'),
                const SizedBox(width: 16),
                const Icon(Icons.share_outlined, size: 20),
                const SizedBox(width: 4),
                Text('${post.shares}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicantRow(String name, String job, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(image), radius: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  'Applied for $job',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Review",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
