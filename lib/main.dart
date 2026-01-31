import 'package:flutter/material.dart';

List<Map<String, dynamic>> dataFilm = [
  {
    "Judul"  : "Sore : Istri dari masa depan",
    "Genre" : "Fantasi Romantis",
    "Rating" : "10/10",
    "Status" : "Sudah Tonton"
  },
  {
    "Judul" : "A Man Called OTTO",
    "Genre" : "Melodrama",
    "Rating" : "10/10",
    "Status" : "Sudah Tonton",
  },
  {
    "Judul" : "Interstellar",
    "Genre" : "Fiksi Ilmiah, Petualangan",
    "Rating" : "10/10",
    "Status" : "Sudah Tonton",
  },
  {
    "Judul" : "Gran Turismo",
    "Genre" : "Sport, Race",
    "Rating" : "8/10",
    "Status" : "Sudah Tonton",
  },
  {
    "Judul" : "Avatar: Fire and Ash",
    "Genre" : "Fantasy",
    "Rating" : "10/10",
    "Status" : "Sudah Tonton",
  },
  {
    "Judul" : "Good Will Hunting",
    "Genre" : "Romance",
    "Rating" : "8/10",
    "Status" : "Belum Tonton",
  },
  {
    "Judul" : "Forrest Gump",
    "Genre" : "Comedy Romance",
    "Rating" : "9/10",
    "Status" : "Sudah Tonton",
  },
  {
    "Judul" : "Moana 2",
    "Genre" : "Animation, fantasy",
    "Rating" : "8/10",
    "Status" : "Sudah Tonton",
  }
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyWatchListApp',
      home: MainPage(),
    );
  }
}

// Widget Utama

class MainPage extends StatefulWidget{
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ListPage(),
  ];

  @override

  Widget build(BuildContext context){
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
          ),
        ],
      ),
    );
  }
}

// Page 1

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My WatchList'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: dataFilm.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index){
            String judul = dataFilm[index]["Judul"];
            String inisial = judul[0];

            return Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  inisial,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// page 2

class ListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ListPage'),
      ),
      body: Center(
        child: Text(
          'ListPage',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
