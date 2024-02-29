import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/popular_movie_screen.dart';
import 'package:movie_app/presentation/pages/search_movies_screen.dart';
import 'package:movie_app/presentation/pages/trending_movie_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[curIdx],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: (value) => setState(() {
          curIdx = value;
        }),
        currentIndex: curIdx,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  final List<Widget> views = [
    const TrendingMoviesScreen(),
    const PopularMoviesScreen(),
    const SearchMoviesScreen(),
  ];
  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      label: 'Trending',
      icon: Icon(Icons.trending_up),
    ),
    const BottomNavigationBarItem(
      label: 'Popular',
      icon: Icon(Icons.public_sharp),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
  ];
}
