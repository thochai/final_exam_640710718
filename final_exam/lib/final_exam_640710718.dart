import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final String email;
  final String phone;
  final String department; // เพิ่มสาขา
  final String birthday; // เพิ่มวันเกิด

  const ProfileCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.department,
    required this.birthday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 233, 251),
            Color.fromARGB(255, 254, 221, 221),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // รูปโปรไฟล์พร้อมเงา
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

          // ชื่อ
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 99, 99, 99),
            ),
          ),
          const SizedBox(height: 5),

          // ตำแหน่ง
          Text(
            role,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),

          // Email
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email, color: Colors.blue),
              const SizedBox(width: 5),
              Text(
                email,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 5),

          // Phone
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, color: Colors.purple),
              const SizedBox(width: 5),
              Text(
                phone,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔥 Department 🔥
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.business, color: Colors.green),
              const SizedBox(width: 5),
              Text(
                department,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 5),

          // 🔥 Birthday 🔥
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cake, color: Colors.pink),
              const SizedBox(width: 5),
              Text(
                birthday,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 241, 174, 207),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔥 ProfileCard 🔥
                ProfileCard(
                  imageUrl:
                      'https://scontent.fbkk17-1.fna.fbcdn.net/v/t39.30808-6/273024340_3579531198940124_7302304397953845423_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGVf01vH8707kknIVqNhuJqbrv2Smpfahluu_ZKal9qGT0CT8IdUrlYPIwG1XmPbTCW4YpRqqwAe3VMLDU-W7H7&_nc_ohc=Rauh93bHMa8Q7kNvgE9Vch-&_nc_oc=AdhL0TjrMth2MRhPMGef3FXHK6LxdNv-nE4x1IaI8qNEnqbc4F46VLuA_IVW8FEDjV8&_nc_zt=23&_nc_ht=scontent.fbkk17-1.fna&_nc_gid=WO1_nAdWhUTTLWbX7p5eQA&oh=00_AYEK5eOAPqvI0w7F8AHqWpUsQZao1FYj-B1bkOfct41Row&oe=67DAC8E3',
                  name: 'Thongchai Klompum',
                  role: 'Student',
                  email: 'klompum_t@silpakorn.edu',
                  phone: '0635169989',
                  department: 'it', // เพิ่มสาขา
                  birthday: '25 May 2002', // เพิ่มวันเกิด
                ),

                const SizedBox(height: 30),

                // 🔥 Form สำหรับอัปเดตสถานะ 🔥
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'สถานะ',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'กรุณากรอกสถานะ' : null,
                        onChanged: (value) => _status = value,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('สถานะที่อัปเดต: $_status'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: const Text('บันทึก'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
