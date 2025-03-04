import 'package:flutter/cupertino.dart';

class ChristianChatPage extends StatelessWidget {
  const ChristianChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final messageMaxWidth = screenWidth * 0.7;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Christian Caparra"),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.back),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileHeader(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          _buildReceivedMessage("Goodmorning sir ask lang po", "images/ChristianCaparra.jpg", messageMaxWidth),
                          _buildSentMessage("ano yun?", messageMaxWidth),
                          _buildReceivedMessage("San po pwede bumili na dd4 na ram", "images/ChristianCaparra.jpg", messageMaxWidth),
                          _buildSentMessage("Itech", messageMaxWidth),
                          _buildSentMessage("Cyberzone", messageMaxWidth),
                          _buildReceivedMessage("Sige po sir Thankyou po", "images/ChristianCaparra.jpg", messageMaxWidth),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'images/ChristianCaparra.jpg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Christian Caparra',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Text(
              '@christian',
              style: TextStyle(color: CupertinoColors.systemGrey),
            ),
            const SizedBox(height: 4),
            const Text(
              '163 followers · 4 posts',
              style: TextStyle(color: CupertinoColors.systemGrey2),
            ),
            const Text(
              'You both follow Jhuniel and 3 others',
              style: TextStyle(color: CupertinoColors.systemGrey2),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              placeholder: "Type a message...",
              placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(CupertinoIcons.arrow_up_circle_fill, color: CupertinoColors.activeBlue, size: 30),
        ],
      ),
    );
  }

  Widget _buildSentMessage(String message, double maxWidth) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: CupertinoColors.activeBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildReceivedMessage(String message, String imageName, double maxWidth) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageName,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message,
                style: const TextStyle(color: CupertinoColors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
