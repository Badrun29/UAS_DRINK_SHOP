import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String drinkName;

  SuccessDialog({required this.drinkName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 80, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Pesanan Kamu Sukses',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                drinkName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Tunggu sampai pesanan anda sampai',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // Tutup dialog
                  Navigator.pushNamed(
                      context, '/orders'); // Navigasi ke halaman pesanan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna tombol
                  foregroundColor: Colors.green, // Warna teks
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Lihat Pesanan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
