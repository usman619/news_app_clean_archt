import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_clean_archt/config/theme/app_themes.dart';
import 'package:news_app_clean_archt/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_archt/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_archt/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_clean_archt/injection_container.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const DailyNews(),
      ),
    );
  }
}
