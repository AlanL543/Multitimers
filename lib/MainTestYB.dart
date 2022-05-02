class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds :1), (_) {
      setState(() => seconds--);
    }); // Timer.periodic
  }

  void stopTimer() {
    timer?.cancel();
  }

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
   final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
      ? Row(
      mainAxisAlignement: MainAxisAlignement.center,
    children: [
    ButtonWidget(
      text: 'Pause',
      onClicked: () {
        stopTimer();
      },
    ), // ButtonWidget
      const Sizedox(width: 12),
      ButtonWidget(
        text: 'Cancel',
        onClicked: ,
      ), // ButtonWidget
    ],
    ) // Row
     : ButtonWidget(
      text: 'Start Timer!',
      color: Colors.black,
      backgroundColor: Colors.white,
      onClicked: () {
        startTimer();
      },
    );
  }

  Widget buildTime() {
    return Text(
      '$seconds',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 80,
      ), // TextStyle
    ); // Text
  }
}