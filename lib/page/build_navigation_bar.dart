import 'package:flutter/material.dart';
import 'package:skins_app/page/perfil_page/pefil_page.dart';
import 'package:skins_app/page/skins_page/skins_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
  final List<Widget> _pages = [    SkinsPage(),    HomeScreen(),    PerfilPage(),  ];


  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }


  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    super.dispose();
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      },
      items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Skins',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  void _onPageChanged() {
    setState(() {
      _currentIndex = _pageController.page!.round();
    });
  }

}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tela Inicial'),
    );
  }
}


