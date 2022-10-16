import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'chat.dart';
import 'package:hillfair2022_frontend/screens/bottomnav/nav.dart';
import 'package:hillfair2022_frontend/screens/chatting/chat_interface.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _Chatting();
}

class _Chatting extends State<Chatting> {



    final client = StreamChatClient(
      'b67pax5b2wdq',
      logLevel: Level.INFO,
    );

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          height: 380.0,
                          width: 320.0,
                          color: Colors.transparent,
                          child: Container(
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                            child: new Container(
                              padding: EdgeInsets.all(20),
                              child: new Text(
                                'Guidlines',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(60),
                          child: new Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                                ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
                                ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
                                'in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              //fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                            width: 500,
                            height: 380,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              color: Colors.transparent,
                              width: 100,
                              height: 40,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  child: Text(
                                      "I Agree",
                                      style: TextStyle(fontSize: 16)
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.deepPurple),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              side: BorderSide(
                                                  color: Colors.black54)
                                          )
                                      )
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          Interface(
                                              client: StreamChatClient(
                                                'b67pax5b2wdq',
                                                logLevel: Level.INFO,
                                              ),
                                              channel: client.channel(
                                                  'messaging',
                                                  id: 'flutterdevs')
                                          ),
                                      ),
                                    );
                                  },
                                  // {
                                  //   showDialog(
                                  //     context: context,
                                  //     builder: (BuildContext context) => PopDialogueBox(),
                                  //   );
                                  //   // Navigator.push(
                                  //   //   context,
                                  //   //   MaterialPageRoute(builder: (context) => const Chat()),
                                  //   // );
                                  // }
                                ),
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
      );
    }
  }




// class PopDialogueBox extends StatefulWidget {
//   const PopDialogueBox({Key? key}) : super(key: key);
//
//   @override
//   State<PopDialogueBox> createState() => PopDialogueBoxState();
// }
//
// class PopDialogueBoxState extends State<PopDialogueBox> {
//   final client = StreamChatClient(
//     'b67pax5b2wdq',
//     logLevel: Level.INFO,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//       title: const Text(
//         'Searching for user',
//         style: TextStyle(
//           color: Colors.deepPurple,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       content: new Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           CircularProgressIndicator(
//             color: Colors.purpleAccent,
//           )
//
//         ],
//       ),
//       actions: <Widget>[
//          TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) =>  MyApp(
//                   client: StreamChatClient(
//                 'b67pax5b2wdq',
//                 logLevel: Level.INFO,
//               ),
//
//                   channel: client.channel('messaging', id: 'flutterdevs')
//               ),
//
//               ),
//             );
//           },
//           // textColor: Theme.of(context).primaryColor,
//           child: const Text(
//             'Start',
//             style: TextStyle(
//               color: Colors.deepPurple,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }




void main() async {

  final client = StreamChatClient(
    'b67pax5b2wdq',
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(id: 'tutorial-flutter'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
  );

  final channel = client.channel('messaging', id: 'flutterdevs');

  await channel.watch();

  runApp(
    MyApp(
      client: client,
      channel: channel,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
    required this.channel,
  }) : super(key: key);

  final StreamChatClient client;

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final themeData =ThemeData(
        primarySwatch: Colors.deepPurple
    );
    final defaultTheme = StreamChatThemeData.fromTheme(themeData);
    final colorTheme =  defaultTheme.colorTheme;
    //ColorScheme.dark(background: Colors.cyan);
    final customTheme = defaultTheme.merge(StreamChatThemeData(
      channelPreviewTheme: StreamChannelPreviewThemeData(
        avatarTheme: StreamAvatarThemeData(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      otherMessageTheme: StreamMessageThemeData(
        messageBackgroundColor: colorTheme.textHighEmphasis,
        messageTextStyle: TextStyle(
          color: colorTheme.barsBg,
        ),
        avatarTheme: StreamAvatarThemeData(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ));
    return MaterialApp(
      theme: themeData,
      builder: (context, widget) {
        streamChatThemeData: StreamChatThemeData.fromTheme(themeData);
        return StreamChat(
          streamChatThemeData: StreamChatThemeData.fromTheme(themeData),
          client: client,
          child: widget,
        );
      },
      debugShowCheckedModeBanner: false,
      home: StreamChannel(
        channel: channel,
        child: const ChannelPage(),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: StreamChannelHeader(
          title: const Text('Message',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading:(
              IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () =>
                      Navigator.of(context).pop()
                // icon: Image.asset('assets/white-back-icon.jpg'),
                // iconSize: 5,
                // onPressed: () {},
              )),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/switch4.png'),
              iconSize: 45,
              onPressed: () {},
            )
          ],
          showConnectionStateTile: false,
          //showConnectionStateTile: false,
          subtitle: const Text('hemlo guyz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 5.00,
            ),),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/PNG.png"),
                    fit: BoxFit.cover),
              ),

              child: Column(
                children: <Widget> [
                  Expanded(
                    child: Stack(
                        children:<Widget> [
                          Container(
                            color: Colors.yellow,
                          ),
                          const StreamMessageListView(
                            showFloatingDateDivider: false,)

                        ]
                      // child: StreamMessageListView(
                      //   showFloatingDateDivider: false,
                    ),


                  ),
                  StreamMessageInput(
                    elevation: 10,
                    shadow: BoxShadow(blurRadius: 0),

                  )
                ],
              ),
            )
        )
    );
  }
}
