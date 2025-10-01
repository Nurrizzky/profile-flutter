import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home:  ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body:  Center(
        child: ProfileCard(),
      ),
    );
  }
}

// Menggunakan StatefulWidget karena kita perlu mengubah state (tampilan)
class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  // Variabel boolean untuk melacak apakah konten tambahan sedang ditampilkan atau tidak
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset:  Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/user.png'),
              backgroundColor: Colors.teal,
            ),


             SizedBox(height: 16),


             Text(
              'Muhammad Nur Rizky',
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),


             SizedBox(height: 4),


            Text(
              'SMK Wikrama Bogor',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),


             SizedBox(height: 30),


            ElevatedButton(
              onPressed: _toggleExpand,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(_isExpanded ? 'See Less' : 'See More'),
            ),


             SizedBox(height: 12),


            // Widget AnimatedSize memberikan efek animasi halus saat ukuran berubah
            AnimatedSize(
              duration:  Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: _isExpanded
                  ? Column(
                      children: [


                         Divider(height: 50),


                        Container(
                          margin:  EdgeInsets.symmetric(vertical: 7.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child:  ListTile(
                            leading: Icon(Icons.person_outline, color: Colors.white),
                            title: Text(
                              '- About',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            subtitle: Text(
                              "Halo! 👋 Saya Muhammad Nur Rizky seorang pelajar dari SMK Wikrama Bogor yang hobi mendengarkan musik dan berenang. Saat ini saya sedang belajar pemrograman, khususnya Flutter, Web Development, dan Go. Saya ingin terus berkembang dan bisa membuat aplikasi bermanfaat untuk banyak orang.",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ),



                        Container(
                          margin:  EdgeInsets.symmetric(vertical: 7.0),
                           decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child:  ListTile(
                            leading: Icon(Icons.lightbulb_outline, color: Colors.white),
                            title: Text(
                              '- Skills',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            subtitle: Text(
                              'HTML, CSS, Javascript, Laravel, Git,',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ),


                      
                        Container(
                          margin:  EdgeInsets.symmetric(vertical: 7.0),
                           decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child:  ListTile(
                            leading: Icon(Icons.school_outlined, color: Colors.white),
                            title: Text(
                              '- History Sekolah',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            subtitle: Text(
                              '• SMK Wikrama Bogor (2023-2026)\n• MTSs Fathan Mubina',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ),



                        Container(
                          margin:  EdgeInsets.symmetric(vertical: 7.0),
                           decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child:  ListTile(
                            leading: Icon(Icons.contacts_outlined, color: Colors.white),
                            title: Text(
                              '- Contact',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            subtitle: Text(
                              '• Email: nurrizkyr90@gmail.com\n• LinkedIn: Muhammad Nur Rizky',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  :  SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}