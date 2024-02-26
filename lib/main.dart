import 'package:lat_flutter/bloc/addnews_bloc.dart';
import 'package:lat_flutter/bloc/detail_bloc.dart';
import 'package:lat_flutter/bloc/editnews_bloc.dart';
import 'package:lat_flutter/repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lat_flutter/bloc/login_bloc.dart';
import 'package:lat_flutter/layout/homepage.dart';
import 'package:lat_flutter/repository/login_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LoginRepository(),
          ),
          RepositoryProvider(
            create: (context) => NewsRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  LoginBloc(loginRepository: context.read<LoginRepository>())
                    ..add(const InitLogin()),
            ),
            BlocProvider(
                create: (context) => AddnewsBloc(
                    newsRepository: context.read<NewsRepository>())),
            BlocProvider(
                create: (context) =>
                    DetailBloc(newsRepository: context.read<NewsRepository>())),
            BlocProvider(
                create: (context) => EditnewsBloc(
                    newsRepository: context.read<NewsRepository>())),
          ],
          child: MaterialApp(
            title: "Home",
            home: HomePage(),
          ),
        ));
  }
}
