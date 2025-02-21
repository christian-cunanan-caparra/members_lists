import 'package:flutter/cupertino.dart';

class MikeChatPage extends StatelessWidget {
  const MikeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final messageMaxWidth = screenWidth * 0.7;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Michael De Ramos"),
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
                          _buildReceivedMessage("Sir anong room po tayo today?", "images/mike.jpg", messageMaxWidth),
                          _buildSentMessage("Sa Drawing Room tayo", messageMaxWidth),
                          _buildReceivedMessage("Wat time po? kaka break palang po namin", "images/mike.jpg", messageMaxWidth),
                          _buildSentMessage("Cge pasok nalang kayo ng 1 pm", messageMaxWidth),
                          _buildSentMessage("Checking ng Activity", messageMaxWidth),
                          _buildReceivedMessage("Sige po sir thank you po", "images/mike.jpg", messageMaxWidth),
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
                'images/mike.jpg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Michael De Ramos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Text(
              '@myyykel27',
              style: TextStyle(color: CupertinoColors.systemGrey),
            ),
            const SizedBox(height: 4),
            const Text(
              '10 followers · 10 posts',
              style: TextStyle(color: CupertinoColors.systemGrey2),
            ),
            const Text(
              'You both follow Christian and 3 others',
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
