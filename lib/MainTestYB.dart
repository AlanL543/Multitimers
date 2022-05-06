class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  void resetTimer() => setState(() => seconds = maxSeconds;

  void startTimer() {
    if (reset) {
      resetTimer();
  }

    timer = Timer.periodic(Duration(seconds :1), (_) {
  setState(() => seconds--);
  } else {
  stopTimer(reset: false);
  }
    }); // Timer.periodic
  }

  void stopTimer() {{bool reset = true}} {
    if (reset) {
      resetTimer();
  }
    setState(() => timer?.cancel());
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
   final isCompleted = seconds == maxSeconds || seconds == 0;
    return isRunning || !isCompleted
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
        onClicked: stopTimer,
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