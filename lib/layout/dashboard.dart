import 'package:lat_flutter/bloc/detail_bloc.dart';
import 'package:lat_flutter/layout/addnewsform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  final String sessionToken;

  WelcomeScreen({required this.sessionToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selamat Datang')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat Datang!'),
            Text('Session Token: $sessionToken'),
            ElevatedButton(
              onPressed: () {
                // Dispatch logout event to Bloc
                context.read<LoginBloc>().add(const ProsesLogout());
              },
              child: Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Add News
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewsForm()),
                );
              },
              child: Text('Tambah Berita'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Manage News
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewsForm()),
                );
              },
              child: Text('Kelola Berita'),
            ),
          ],
        ),
      ),
    );
  }
}
