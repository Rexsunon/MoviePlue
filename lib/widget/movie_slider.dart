import 'index.dart';

class MovieSlider extends StatefulWidget {
  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final PageController ctrl = PageController(viewportFraction: 0.8);

  int currentPage = 0;

  var movieBaner = [
    {'img': 'assets/images/the_joker_baner.jpg', 'name': 'Joker'},
    {
      'img': 'assets/images/avengers_infinity_war.jpg',
      'name': 'Avengers Infinity War'
    },
    {
      'img': 'assets/images/avengers_endgame_baner.jpg',
      'name': 'Avengers Endgame'
    }
  ];

  @override
  void initState() {
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: ctrl,
      itemCount: movieBaner.length,
      itemBuilder: (BuildContext context, int index) {
        if (movieBaner.length >= index) {
          bool active = index == currentPage;
          return _buildStoryPage(movieBaner[index], active);
        }
      },
    );
  }

  _buildStoryPage(Map data, bool active) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 20 : 80;
    final double bottom = active ? 20 : 100;

    return Column(
      children: <Widget>[
        Expanded(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuint,
            margin: EdgeInsets.only(top: top, bottom: bottom, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(data['img']),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: blur,
                    offset: Offset(offset, offset))
              ],
            ),
          ),
        ),
        Text(
          "${data['name']}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
