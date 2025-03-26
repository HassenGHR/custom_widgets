import 'package:flutter/material.dart';

class DraggableScrollableWidget extends StatelessWidget {
  const DraggableScrollableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Draggable Scrollable UI")),
      body: Stack(
        children: [
          const Center(
            child: Text("Background Content"),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.15,
            initialChildSize: 0.15,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return AnimatedBuilder(
                animation: scrollController,
                builder: (context, child) {
                  double percentage = 0.15;
                  if (scrollController.hasClients) {
                    percentage = scrollController.position.viewportDimension /
                        MediaQuery.of(context).size.height;
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "Draggable Sheet",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: percentage == 1 ? 1 : 0,
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: imageList.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: ListTile(
                                        leading: Image.asset(
                                          imageList[index]["image"]!,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(imageList[index]["title"]!),
                                        subtitle:
                                            const Text("Image description"),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Opacity(
                                opacity: percentage == 1 ? 0 : 1,
                                child: MyEventItem(
                                  event: "Event Data",
                                  percentageCompleted: percentage,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyEventItem extends StatelessWidget {
  final String event;
  final double percentageCompleted;

  const MyEventItem({
    super.key,
    required this.event,
    required this.percentageCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.event, size: 50, color: Colors.blue),
          const SizedBox(height: 10),
          Text(event, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 5),
          Text("Progress: ${(percentageCompleted * 100).toInt()}%",
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}

// Static List of Images
final List<Map<String, String>> imageList = [
  {"image": "assets/images/img1.jpg", "title": "Image 1"},
  {"image": "assets/images/img2.jpg", "title": "Image 2"},
  {"image": "assets/images/img3.jpg", "title": "Image 3"},
  {"image": "assets/images/img4.jpg", "title": "Image 4"},
  {"image": "assets/images/img5.jpg", "title": "Image 5"},
  {"image": "assets/images/img6.jpg", "title": "Image 6"},
];
