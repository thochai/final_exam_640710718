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
      child: Column(
        children: [
          
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 50, 
              backgroundImage: NetworkImage(imageUrl), 
            ),
          ),

          const SizedBox(height: 15),

          
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 99, 99, 99),
            ),
          ),

          const SizedBox(height: 5),

          
          Text(
            email,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.settings, color: Colors.blue),
              const SizedBox(width: 5),
              Text(
                settings,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 5),

         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline, color: Colors.purple),
              const SizedBox(width: 5),
              Text(
                phone,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 10),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.circle_notifications_rounded, color: Colors.green), 
              const SizedBox(width: 5),
              Text(
                department,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 5),

          
          
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
  State<answer1> createState() => _MyAppState();
}

class _MyAppState extends State<answer1> {
  
  final _formKey = GlobalKey<FormState>();
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          title: const Text(
            'โปรไฟล์ผู้ใช้งาน',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 57, 116, 254), // สีของ AppBar
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("แก้ไขโปรไฟล์")),
);
                        },
                        child: const Text('แก้ไขโปรไฟล์'),
                        
                      ),
                       SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                        
                        child: const Text('ออกจากระบบ'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
