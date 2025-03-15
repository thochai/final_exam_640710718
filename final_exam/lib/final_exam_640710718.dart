import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final String email;
  final String phone;

  const ProfileCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              role,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, color: Colors.blue),
                const SizedBox(width: 5),
                Text(email),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone,
                    color: Color.fromARGB(255, 235, 137, 255)),
                const SizedBox(width: 5),
                Text(phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 206, 234),
        appBar: AppBar(
          title: const Text('Custom Widget'),
          backgroundColor: const Color.fromARGB(255, 252, 175, 221),
          elevation: 0,
        ),
        body: Center(
          child: ProfileCard(
            imageUrl:
                'https://scontent.fbkk17-1.fna.fbcdn.net/v/t39.30808-6/273024340_3579531198940124_7302304397953845423_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGVf01vH8707kknIVqNhuJqbrv2Smpfahluu_ZKal9qGT0CT8IdUrlYPIwG1XmPbTCW4YpRqqwAe3VMLDU-W7H7&_nc_ohc=Rauh93bHMa8Q7kNvgE9Vch-&_nc_oc=AdhL0TjrMth2MRhPMGef3FXHK6LxdNv-nE4x1IaI8qNEnqbc4F46VLuA_IVW8FEDjV8&_nc_zt=23&_nc_ht=scontent.fbkk17-1.fna&_nc_gid=WO1_nAdWhUTTLWbX7p5eQA&oh=00_AYEK5eOAPqvI0w7F8AHqWpUsQZao1FYj-B1bkOfct41Row&oe=67DAC8E3',
            name: '"Thongchai Klompum"',
            role: 'Student',
            email: 'klompum_t@silpakorn.edu',
            phone: '0635169989',
          ),
        ),
      ),
    );
  }
}

