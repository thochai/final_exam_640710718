import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final String settings;
  final String phone;
  final String department;

  const ProfileCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.settings,
    required this.phone,
    required this.department,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 15),
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            email,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 10),

          // Settings
          _buildProfileInfoRow(Icons.settings, settings, Colors.blue),
          _buildProfileInfoRow(Icons.lock_outline, phone, Colors.purple),
          _buildProfileInfoRow(
              Icons.circle_notifications_rounded, department, Colors.green),
        ],
      ),
    );
  }

  Widget _buildProfileInfoRow(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const answer1());
}

class answer1 extends StatefulWidget {
  const answer1({Key? key}) : super(key: key);

  @override
  State<answer1> createState() => _UserProfileAppState();
}

class _UserProfileAppState extends State<answer1> {
  String _status = '';

  void _updateStatus(String newStatus) {
    setState(() {
      _status = newStatus;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(newStatus),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          title: const Text(
            'โปรไฟล์ผู้ใช้งาน',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF3974FE),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ProfileCard(
                imageUrl:
                    'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png',
                name: 'Thongchai Klompum',
                email: 'klompum_t@silpakorn.edu',
                settings: 'การตั้งค่า',
                phone: 'เปลี่ยนรหัส',
                department: 'ความเป็นส่วนตัว',
              ),
              const SizedBox(height: 30),

              
              ElevatedButton(
                onPressed: () => _updateStatus('แก้ไขโปรไฟล์สำเร็จ'),
                style: ElevatedButton.styleFrom(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'แก้ไขโปรไฟล์',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),

              
              ElevatedButton(
                onPressed: () => _updateStatus('ออกจากระบบสำเร็จ'),
                style: ElevatedButton.styleFrom(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'ออกจากระบบ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),

              const SizedBox(height: 16),

             
              if (_status.isNotEmpty)
                Text(
                  _status,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
