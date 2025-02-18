import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GroupChatPage.dart';
import 'InformationPage.dart';

void main() {
  runApp(const CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Instagram-Messenger",
          style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.info_circle, size: 25, color: CupertinoColors.activeBlue),
          onPressed: () => _showInfoDialog(context),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Search
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoSearchTextField(
                placeholder: "Search Contacts",
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),

            const SizedBox(height: 10),

            // Stories Section
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: stories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildYourStory();
                  }
                  return _buildStoryTile(stories[index - 1]);
                },
              ),
            ),

            // Group Chat & Info Page Buttons
            _buildChatButton(context, "DevOps GC", "images/sir.jpg", const GroupChatPage()),
            _buildChatButton(context, "Information Page", "images/shield.jpg", const InformationPage()),

            // Participants List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemCount: participants.length,
                itemBuilder: (context, index) {
                  return _buildParticipantTile(context, participants[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build "Your Story" Widget
  Widget _buildYourStory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              ClipOval(
                child: Image.asset("images/sir.jpg", height: 60, width: 60, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: CupertinoColors.white, width: 2),
                  ),
                  child: const Icon(CupertinoIcons.add, color: CupertinoColors.white, size: 20),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text("Your Story", style: TextStyle(fontSize: 12, color: CupertinoColors.white)),
        ],
      ),
    );
  }

  // Build Story Tile
  Widget _buildStoryTile(Map<String, String> story) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(story["image"]!, height: 60, width: 60, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 5),
          Text(story["name"]!, style: const TextStyle(fontSize: 12, color: CupertinoColors.white)),
        ],
      ),
    );
  }

  // Build Chat Button
  Widget _buildChatButton(BuildContext context, String title, String imagePath, Widget page) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => page)),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipOval(child: Image.asset(imagePath, height: 50, width: 50, fit: BoxFit.cover)),
            const SizedBox(width: 10),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: CupertinoColors.white))),
            const Icon(CupertinoIcons.chevron_right, color: CupertinoColors.systemGrey),
          ],
        ),
      ),
    );
  }

  // Build Participant Tile
  Widget _buildParticipantTile(BuildContext context, Map<String, String> participant) {
    return GestureDetector(
      onTap: () => _showParticipantDialog(context, participant),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipOval(child: Image.asset(participant["image"]!, height: 50, width: 50, fit: BoxFit.cover)),
            const SizedBox(width: 10),
            Text(participant["name"]!, style: const TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  // Show Info Dialog
  void _showInfoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Group Members', style: TextStyle(color: CupertinoColors.white)),
          content: Column(
            children: members.map((member) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    ClipOval(child: Image.asset(member["image"]!, height: 50, width: 50, fit: BoxFit.cover)),
                    const SizedBox(width: 10),
                    Text(member["name"]!, style: const TextStyle(fontSize: 14, color: CupertinoColors.white)),
                  ],
                ),
              );
            }).toList(),
          ),
          actions: [
            CupertinoButton(
              child: const Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  // Show Participant Dialog
  void _showParticipantDialog(BuildContext context, Map<String, String> participant) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(participant["name"]!, style: const TextStyle(color: CupertinoColors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(child: Image.asset(participant["image"]!, height: 80, width: 80, fit: BoxFit.cover)),
              const SizedBox(height: 10),
              Text("Email: ${participant["email"]}", style: const TextStyle(fontSize: 14, color: CupertinoColors.white)),
              Text("Phone: ${participant["phone"]}", style: const TextStyle(fontSize: 14, color: CupertinoColors.white)),
            ],
          ),
          actions: [
            CupertinoButton(
              child: const Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}

// Data
List<Map<String, String>> stories = [
  {"name": "Christian Caparra", "image": "images/ChristianCaparra.jpg"},
  {"name": "Jhuniel Galang", "image": "images/Jhuniel.jpg"},
  {"name": "John Lloyd Guevarra", "image": "images/JL.jpg"},
  {"name": "Michael De Ramos", "image": "images/mike.jpg"},
];

List<Map<String, String>> members = List.from(stories);
List<Map<String, String>> participants = List.from(stories);
