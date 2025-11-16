import 'package:flutter/material.dart';
import 'package:internshala/Screens/Job_Seeker_screen/Job_Seeker_Chat_page.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                // Back Button (FUNCTIONAL)
                GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagesScreen()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black87,
                    size: 22,
                  ),
                ),

                const SizedBox(width: 10),

                // Profile + Name
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("Assets/Images/stevejobs.png"),
                ),

                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Siya Sharma",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Today",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                Spacer(),

                // Call + Video Icons
                Icon(Icons.call_outlined),
                const SizedBox(width: 10),
                Icon(Icons.videocam_outlined),
              ],
            ),
          ),
        ),
      ),

      // BODY MESSAGES
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: [
                // User message (right)
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text: "Hello Mam, Good Morning",
                    time: "09:30 am",
                    isMe: true,
                  ),
                ),

                // Other user
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Morning, Can i help you ?",
                    time: "09:31 am",
                    isMe: false,
                  ),
                ),

                // User
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text:
                        "I saw the UI/UX Designer vacancy that you uploaded on linkedin yesterday and I am interested in joining your company.",
                    time: "09:33 am",
                    isMe: true,
                  ),
                ),

                // Other
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Oh yes, please send your CV/Resume here",
                    time: "09:35 am",
                    isMe: false,
                  ),
                ),

                // PDF message card
                Align(
                  alignment: Alignment.centerRight,
                  child: PdfMessageCard(
                    fileName: "MY- CV - UI/UX Designer.PDF",
                    fileSize: "866Kb",
                    time: "09:37 am",
                  ),
                ),
              ],
            ),
          ),

          buildMessageInput(),
        ],
      ),

      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home_filled, size: 30, color: Colors.black54),
            Icon(Icons.chat_bubble_rounded, size: 30, color: Colors.black54),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
            Icon(Icons.notifications_none, size: 30, color: Colors.black54),
            Icon(Icons.person_outline, size: 30, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write your message...",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.send, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text, time;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.text,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      constraints: BoxConstraints(maxWidth: 260),
      decoration: BoxDecoration(
        color: isMe ? Color(0xff0B2C4E) : Color(0xffF9EDE3),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(18),
          topRight: const Radius.circular(18),
          bottomLeft: Radius.circular(isMe ? 18 : 0),
          bottomRight: Radius.circular(isMe ? 0 : 18),
        ),
      ),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black87,
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 6),
          Text(time, style: TextStyle(fontSize: 10, color: Colors.white70)),
        ],
      ),
    );
  }
}

class PdfMessageCard extends StatelessWidget {
  final String fileName, fileSize, time;

  const PdfMessageCard({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(maxWidth: 270),
      decoration: BoxDecoration(
        color: Color(0xff0B2C4E),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "$fileSize PDF",
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.white70),
        ],
      ),
    );
  }
}
