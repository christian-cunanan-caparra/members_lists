import 'package:flutter/cupertino.dart';
import 'group_chat.dart';
import 'information_page.dart';



class Chat extends StatefulWidget {
  const Chat({super.key});


@override
State<Chat> createState() => _chatState();
}

class _chatState extends State<Chat> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredParticipants = List.from(participants);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterParticipants);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterParticipants);
    _searchController.dispose();
    super.dispose();
  }

  void _filterParticipants() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredParticipants = participants.where((participant) {
        final name = participant["name"]!.toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "RonnieSngl",
          style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.info_circle, size: 25, color: CupertinoColors.activeBlue),
          onPressed: () {
            _showInfoDialog(context);
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: "Ask Meta AI or Search",
                style: const TextStyle(color: CupertinoColors.white),
                onChanged: (value) {
                  _filterParticipants();
                },
              ),
            ),
            const SizedBox(height: 10),

            //story tohh

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [

                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Your Story", "images/gfnisir.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: CupertinoColors.activeBlue, width: 2), // Blue border
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "images/gfnisir.jpg",
                                    height: 75,
                                    width: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.activeBlue,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.add,
                                    color: CupertinoColors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Your Story",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Christian Caparra", "images/ChristianCaparra.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/ChristianCaparra.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Christian Caparra",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Jhuniel Galang", "images/Jhuniel.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/Jhuniel.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Jhuniel Galang",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "John Lloyd Guevarra", "images/JL.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/JL.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "John Lloyd Guevarra",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showStoryDialog(context, "Michael De Ramos", "images/mike.jpg"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: CupertinoColors.activeBlue, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "images/mike.jpg",
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Michael De Ramos",
                            style: TextStyle(fontSize: 12, color: CupertinoColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 10),

            // Scrollable
            Expanded(
              child: ListView(
                children: [
                  // Group Chat Button
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const group_chat()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "images/sir.jpg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              "DevOps Gc",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: CupertinoColors.white),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  // "InformationPage" Group Chat Button
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const information_page()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "images/shield.jpg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              "Resume of the Members",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: CupertinoColors.white),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  // Contact List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    itemCount: filteredParticipants.length,
                    itemBuilder: (context, index) {
                      var participant = filteredParticipants[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: GestureDetector(
                          onTap: () {
                            _showParticipantDialog(context, participant);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  participant["image"]!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      participant["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CupertinoColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  // Info
  void _showInfoDialog(BuildContext context) {
    List<Map<String, String>> members = [
      {"name": "Christian Caparra", "image": "images/ChristianCaparra.jpg"},
      {"name": "Jhuniel Galang", "image": "images/Jhuniel.jpg"},
      {"name": "John Lloyd Guevarra", "image": "images/JL.jpg"},
      {"name": "Michael De Ramos", "image": "images/mike.jpg"},
    ];

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Group Members', style: TextStyle(color: CupertinoColors.white)),
          content: SizedBox(
            height: 250,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(members.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            members[index]["image"]!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          members[index]["name"]!,
                          style: const TextStyle(fontSize: 14, color: CupertinoColors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          actions: [
            CupertinoButton(
              child: const Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Show information dialog
  void _showParticipantDialog(BuildContext context, Map<String, String> participant) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(participant["name"]!, style: const TextStyle(color: CupertinoColors.white)),
          content: SizedBox(
            height: 150, // Adjust the height as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Align content to the bottom
              children: [
                ClipOval(
                  child: Image.asset(
                    participant["image"]!,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Email: ${participant["email"]}",
                  style: const TextStyle(fontSize: 14, color: CupertinoColors.white),
                ),
                Text(
                  "Phone: ${participant["phone"]}",
                  style: const TextStyle(fontSize: 14, color: CupertinoColors.white),
                ),
              ],
            ),
          ),
          actions: [
            CupertinoButton(
              child: const Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

// Data
List<Map<String, String>> participants = [
  {"name": "Christian Caparra", "image": "images/ChristianCaparra.jpg", "email": "caparrachristian47@gmail.com", "phone": "+639942060319"},
  {"name": "Jhuniel Galang", "image": "images/Jhuniel.jpg", "email": "JhunielGalang@gmail.com", "phone": "+63123456789"},
  {"name": "John Lloyd Guevarra", "image": "images/JL.jpg", "email": "johnlloydguevarra0405@gmail.com", "phone": "+639106284501"},
  {"name": "Michael De Ramos", "image": "images/mike.jpg", "email": "deramosmichael27@gmail.com", "phone": "+639871654565"},
];


void _showStoryDialog(BuildContext context, String name, String imagePath) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        child: Stack(
          children: [
            // Fullscreen Story Image
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            // Name Overlay (Top-Left)
            Positioned(
              top: 40,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),


              ),
            ),

            // Close Button (Top-Right)
            Positioned(
              top: 35,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CupertinoColors.black,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: CupertinoColors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}




