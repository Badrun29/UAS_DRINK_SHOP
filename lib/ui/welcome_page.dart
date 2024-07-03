import 'package:flutter/material.dart';
import 'drink_list_page.dart'; // Pastikan Anda mengimpor halaman daftar minuman
import 'order_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Drink Shop'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.local_drink), text: 'Drinks'),
              Tab(icon: Icon(Icons.local_drink), text: 'Order History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeTab(), // Tab halaman beranda
            DrinkListPage(), // Tab halaman daftar minuman
            OrderPage(),
          ],
        ),
      ),
    );
  }
}

// Halaman beranda
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Bagian atas dengan saldo dan gambar profil
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          size: 30, color: Colors.grey[700]),
                      SizedBox(width: 10),
                      Text('Rp 250.000',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://example.com/your-profile-pic.jpg'), // Ganti dengan URL gambar profil Anda
                  ),
                ],
              ),
            ),
            // Pesan selamat datang
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Nikmati Hari-Harimu\nDengan Kopi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Kartu diskon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Diskon',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Up To\n50%',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Bagian menu terbaik
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Best Menu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Daftar menu terbaik belum pakai api
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    MenuCard(
                      imageUrl:
                          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/09a03f52-279d-4219-996d-ca001602c781_Go-Biz_20231101_023704.jpeg',
                      name: 'Kopi Machiato',
                      description: 'Kopi Machiato',
                      price: 'Rp 10.000',
                      onTap: () {
                        Navigator.pushNamed(context, '/drinks');
                      },
                    ),
                    SizedBox(width: 10),
                    MenuCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt86DsU1Q3xw88uFHJBX_QMC8I3y-B6g4TyQ&s',
                      name: 'Kopi Biasa',
                      description: 'Kopi Biasa',
                      price: 'Rp 25.000',
                      onTap: () {
                        Navigator.pushNamed(context, '/drinks');
                      },
                    ),
                    SizedBox(width: 10),
                    MenuCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsVpReHzIAQ2UDvO1xy0mvM1NejIeQw2rjVQ&s',
                      name: 'Kopi + Cookies',
                      description: 'Kopi + Cookies',
                      price: 'Rp 25.000',
                      onTap: () {
                        Navigator.pushNamed(context, '/drinks');
                      },
                    ),
                    // Tambahkan lebih banyak MenuCard di sini
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;
  final VoidCallback onTap;

  MenuCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 5),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
