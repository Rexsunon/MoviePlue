import 'index.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('R Strems'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text('Recent', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Expanded(child: MovieSlider()),
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
