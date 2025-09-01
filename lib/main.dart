import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: 'Poppins',
        // Atur tema untuk card agar lebih konsistenz
        cardTheme: CardThemeData(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      home: const ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Memberi background warna sedikit abu-abu agar card terlihat menonjol
      backgroundColor: Colors.grey[800],
      body: const Center(
        // Widget Center untuk meletakkan card di tengah layar
        child: ProfileCard(),
      ),
    );
  }
}

// Menggunakan StatefulWidget karena kita perlu mengubah state (tampilan) dari card
class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  // Variabel boolean untuk melacak apakah card sedang dalam mode expanded atau tidak
  bool _isExpanded = false;

  // Fungsi untuk mengubah state ketika tombol ditekan
  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // Memberi sedikit margin horizontal agar tidak terlalu mepet ke tepi layar kecil
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black54,
      clipBehavior: Clip.antiAlias, // Untuk memastikan konten di dalam card mengikuti rounded corner
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisSize.min membuat column hanya setinggi kontennya
          mainAxisSize: MainAxisSize.min,
          children: [
            // FOTO DIATAS
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/user.png'), // Ganti dengan URL gambar Anda
              backgroundColor: Colors.teal,
            ),
            const SizedBox(height: 16),

            // NAMA
            const Text(
              'Muhammad Nur Rizky',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // SEKOLAH
            Text(
              'SMK Wikrama Bogor',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),

            // TOMBOL SEE MORE
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
            const SizedBox(height: 12),

            // KONTEN TAMBAHAN YANG BISA MUNCUL DAN HILANG
            // Widget AnimatedSize memberikan efek animasi halus saat ukuran berubah
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: _isExpanded ? _buildExpandedContent() : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membangun konten detail yang akan ditampilkan
  Widget _buildExpandedContent() {
    return Column(
      children: [
        const Divider(height: 50),
        _buildDetailCard(
          icon: Icons.person_outline,
          title: '- About',
          content: "Halo! 👋 Saya Muhammad Nur Rizky seorang pelajar dari SMK Wikrama Bogor yang hobi mendengarkan musik dan berenang. Saat ini saya sedang belajar pemrograman, khususnya Flutter, Web Development, dan Go. Saya ingin terus berkembang dan bisa membuat aplikasi bermanfaat untuk banyak orang.",
        ),
        _buildDetailCard(
          icon: Icons.lightbulb_outline,
          title: '- Skills',
          content: 'HTML, CSS, Javascript, Laravel, Git,',
        ),
        _buildDetailCard(
          icon: Icons.school_outlined,
          title: '- History Sekolah',
          content: '• SMK Wikrama Bogor (2023-2026)\n• MTSs Fathan Mubina',
        ),
         _buildDetailCard(
          icon: Icons.contacts_outlined,
          title: '- Contact',
          content: '• Email: nurrizkyr90@gmail.com\n• LinkedIn: Muhammad Nur Rizky',
        ),
      ],
    );
  }

  // Helper widget untuk membuat card detail yang seragam (About, Skills, dll)
  Widget _buildDetailCard({required IconData icon, required String title, required String content}) {
    return Card(
      elevation: 2, // Beri sedikit bayangan agar terpisah dari card utama
      color: Colors.grey.shade800,
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          content,
          style: const TextStyle(color: Colors.white),
          ),
      ),
    );
  }
}