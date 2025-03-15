import 'package:flutter/material.dart';

void main() {
  runApp(const answer2());
}

class answer2 extends StatelessWidget {
  const answer2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String province = 'ในเมือง';
  bool acceptTerms = false;
  
 String? _radioValue = 'Option 1';

  final List<String> provinces = [
    'ในเมือง',
    'ต่างจังหวัด',
    'ต่างประเทศ',
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("คำนวณค่าจัดส่ง")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Switch สำหรับเปิด/ปิดใช้งานฟอร์ม
            
            const SizedBox(height: 16),
            
            // เมื่อ switchValue เป็น false ให้ซ่อนฟอร์ม
           
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "น้ำหนักสินค้า"),
                      onChanged: (value) {
                        setState(() {
                          fullName = value;
                        });
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    
                    const SizedBox(height: 16),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: "เลือกระยะทาง"),
                      value: province,
                      items: provinces.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          province = value.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CheckboxListTile(
                      title: const Text("แพ็คกิ้งพิเศษ+20"),
                      value: acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          acceptTerms = value!;
                        });
                      },
                    ),
                     CheckboxListTile(
                      title: const Text("ประกดันพัสดุ+50"),
                      value: acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          acceptTerms = value!;
                        });
                      },
                    ),
                    Column(
                      
                  children: [
                   RadioListTile<String>(
                   title: Text('ปกติ'),
                      value: 'Option 1',
                      groupValue: _radioValue,
                      onChanged: (String? value) {
                        setState(() {
                      _radioValue = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('ด่วน'),
                  value: 'Option 2',
                  groupValue: _radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('ด่วนพิเศษ'),
                  value: 'Option 3',
                  groupValue: _radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
              ],
            ),
                    const SizedBox(height: 16),
                    
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton( //
                        onPressed: acceptTerms
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  // Handle form submission
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Form Submitted!")),
                                  );
                                }
                              }
                            : null,
                        child: const Text("คำนวณราคา"),
                      ),
                    ),
                    
                  ],
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
