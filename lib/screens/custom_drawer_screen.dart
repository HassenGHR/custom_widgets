// import 'package:animations_widgets/widgets/custom_drawer.dart';
// import 'package:flutter/material.dart';

// class AnimatedDrawerScreen extends StatefulWidget {
//   const AnimatedDrawerScreen({Key? key}) : super(key: key);

//   @override
//   _AnimatedDrawerScreenState createState() => _AnimatedDrawerScreenState();
// }

// class _AnimatedDrawerScreenState extends State<AnimatedDrawerScreen> {
//   final GlobalKey<_AnimatedDrawerScreenState> _scaffoldKey =
//       GlobalKey<_AnimatedDrawerScreenState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.menu, color: Colors.white),
//           onPressed: () {
//             CustomDrawer.of(context)?.toggle();
//           },
//         ),
//         title: const Text(
//           'My App',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Featured Section
//               _buildSectionTitle('Featured'),
//               _buildFeaturedSection(),

//               const SizedBox(height: 24),

//               // Quick Actions
//               _buildSectionTitle('Quick Actions'),
//               _buildQuickActionGrid(),

//               const SizedBox(height: 24),

//               // Recent Activities
//               _buildSectionTitle('Recent Activities'),
//               _buildRecentActivityList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.deepPurple[800],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeaturedSection() {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.deepPurple[400]!,
//             Colors.deepPurple[600]!,
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.deepPurple.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 20,
//             left: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Welcome Back!',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Explore your dashboard',
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.deepPurple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text('Get Started'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickActionGrid() {
//     return GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       childAspectRatio: 1.5,
//       mainAxisSpacing: 12,
//       crossAxisSpacing: 12,
//       children: [
//         _buildQuickActionCard(
//           icon: Icons.add,
//           title: 'New Task',
//           color: Colors.blue,
//         ),
//         _buildQuickActionCard(
//           icon: Icons.analytics,
//           title: 'Analytics',
//           color: Colors.green,
//         ),
//         _buildQuickActionCard(
//           icon: Icons.notifications,
//           title: 'Notifications',
//           color: Colors.orange,
//         ),
//         _buildQuickActionCard(
//           icon: Icons.settings,
//           title: 'Settings',
//           color: Colors.purple,
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickActionCard({
//     required IconData icon,
//     required String title,
//     required Color color,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color.withOpacity(0.3), width: 1),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: color, size: 40),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             style: TextStyle(
//               color: color,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRecentActivityList() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.deepPurple[100],
//             child: Icon(
//               _getActivityIcon(index),
//               color: Colors.deepPurple,
//             ),
//           ),
//           title: Text(_getActivityTitle(index)),
//           subtitle: Text(_getActivitySubtitle(index)),
//           trailing: Text(
//             _getActivityTime(index),
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   IconData _getActivityIcon(int index) {
//     switch (index) {
//       case 0:
//         return Icons.task;
//       case 1:
//         return Icons.message;
//       case 2:
//         return Icons.update;
//       default:
//         return Icons.notifications;
//     }
//   }

//   String _getActivityTitle(int index) {
//     switch (index) {
//       case 0:
//         return 'Task Completed';
//       case 1:
//         return 'New Message';
//       case 2:
//         return 'System Update';
//       default:
//         return 'Activity';
//     }
//   }

//   String _getActivitySubtitle(int index) {
//     switch (index) {
//       case 0:
//         return 'Project milestone reached';
//       case 1:
//         return 'You have a new message';
//       case 2:
//         return 'App version 2.0 available';
//       default:
//         return 'Recent activity';
//     }
//   }

//   String _getActivityTime(int index) {
//     switch (index) {
//       case 0:
//         return '2h ago';
//       case 1:
//         return '4h ago';
//       case 2:
//         return '6h ago';
//       default:
//         return 'Just now';
//     }
//   }
// }
