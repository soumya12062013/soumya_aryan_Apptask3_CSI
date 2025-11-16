import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:internshala/Screens/Job_Seeker_screen/taking_page.dart';

class JobGiverChatPage extends StatelessWidget {
  JobGiverChatPage({super.key});

  final List<Map<String, dynamic>> chats = [
    {
      "name": "Siya Sharma",
      "msg": "Oh yes, please send your CV/Res...",
      "time": "5m ago",
      "unread": 2,
      "avatar": "https://randomuser.me/api/portraits/women/68.jpg",
    },
    {
      "name": "Riya Garg",
      "msg": "Hello sir, Good Morning",
      "time": "30m ago",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/women/72.jpg",
    },
    {
      "name": "Sumit Roy",
      "msg": "I saw the UI/UX Designer vac...",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/men/70.jpg",
    },
    {
      "name": "Surbhi Jaiswal",
      "msg": "I saw the UI/UX Designer vac...",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/women/12.jpg",
    },
    {
      "name": "Dev Sharma",
      "msg": "I saw the UI/UX Designer vac...",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/men/45.jpg",
    },
    {
      "name": "Soumya Arya",
      "msg": "Hello sir, Good Morning",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/women/77.jpg",
    },
    {
      "name": "Tanya Mittal",
      "msg": "I saw the UI/UX Designer vac...",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/women/21.jpg",
    },
    {
      "name": "Rashmi Gupta",
      "msg": "Hello sir, Good Morning",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/women/28.jpg",
    },
    {
      "name": "Tanu Raghav",
      "msg": "I saw the UI/UX Designer vac...",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/women/90.jpg",
    },
    {
      "name": "Sonia Garg",
      "msg": "I saw the UI/UX Designer vac...",
      "time": "09:30 am",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/women/65.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// TOP APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 15, right: 15),
          decoration: BoxDecoration(
            color: Color(0xff0A2A5A),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.network(
                  //   "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/NeuraLogo.png/120px-NeuraLogo.png",
                  //   height: 35,
                  // ),
                  Container(
                    width: 200,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search, size: 20),
                      ),
                    ),
                  ),
                  Icon(Icons.notifications, color: Colors.white, size: 26),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Text("🇮🇳", style: TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Text(
                "Messages",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      /// BODY
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  hintText: "Search message",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final c = chats[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            // name: c["name"],
                            //avatar: c["avatar"],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(c["avatar"]),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c["name"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  c["msg"],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                c["time"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              c["unread"] > 0
                                  ? CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.orange,
                                      child: Text(
                                        c["unread"].toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },

                // /// BOTTOM NAVIGATION WITH CENTER BUTTON
                // bottomNavigationBar: Stack(
                //   alignment: Alignment.center,
                //   children: [
                //     Container(
                //       height: 80,
                //       decoration:  BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                //           boxShadow: [
                //             BoxShadow(
                //                 color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))
                //           ]),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children:  [
                //           Icon(Icons.home_outlined, size: 28),
                //           Icon(Icons.receipt_long_outlined, size: 28),
                //           SizedBox(width: 60),
                //           Icon(Icons.person_outline, size: 28),
                //           Icon(Icons.settings_outlined, size: 28),
                //         ],
                //       ),
                //     ),

                //     /// Center button
                //     Positioned(
                //       bottom: 25,
                //       child: Container(
                //         height: 60,
                //         width: 60,
                //         decoration:  BoxDecoration(
                //             color: Color(0xff0A2A5A), shape: BoxShape.circle),
                //         child:  Icon(Icons.add, size: 32, color: Colors.white),
                //       ),
                //     )
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
