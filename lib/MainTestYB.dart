class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int seconds = maxSeconds;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: GradientWidget(
      child: Center(
        child: Column
          mainAxisAlignement: MainAxisAlignement.center,
        children: [
              buildTime(),
        const SizedBox(height: 80),
        buildButtons(),
      ],
      ), //Column
      ), // Center
    ), // GradientWidget
  ); // Scaffold

  Widget buildButtons() {
    return ButtonWidget(
      text: 'Start Timer!',
      color: Colors.black,
      backgroundColor: Colors.white,
      onClicked: () {},
    );
  }

  Widget buildTime() {
    return Text(
      '$seconds',
    );
  }
}