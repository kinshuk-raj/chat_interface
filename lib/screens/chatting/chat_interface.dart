import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
//
// void main() async {
//
//   final client = StreamChatClient(
//     'b67pax5b2wdq',
//     logLevel: Level.INFO,
//   );
//
//   await client.connectUser(
//     User(id: 'chat-flutter'),
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
//   );
//
//   final channel = client.channel('messaging', id: 'flutterdevs');
//
//   await channel.watch();
//
//   runApp(
//     Interface(
//       client: client,
//       channel: channel,
//     ),
//   );
// }
// //Channel(client, type, id, name: 'Channel name')
// class Interface extends StatelessWidget {
//   /// To initialize this example, an instance of [client] and [channel] is required.
//   const Interface({
//     Key? key,
//     required this.client,
//     required this.channel,
//   }) : super(key: key);
//
//   final StreamChatClient client;
//
//   final Channel channel;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final themeData =ThemeData(
//         primarySwatch: Colors.deepPurple
//     );
//     final defaultTheme = StreamChatThemeData.fromTheme(themeData);
//     final colorTheme =  defaultTheme.colorTheme;
//     //ColorScheme.dark(background: Colors.cyan);
//     final customTheme = defaultTheme.merge(StreamChatThemeData(
//       channelPreviewTheme: StreamChannelPreviewThemeData(
//         avatarTheme: StreamAvatarThemeData(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       otherMessageTheme: StreamMessageThemeData(
//         messageBackgroundColor: colorTheme.textHighEmphasis,
//         messageTextStyle: TextStyle(
//           color: colorTheme.barsBg,
//         ),
//         avatarTheme: StreamAvatarThemeData(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     ));
//     return MaterialApp(
//       theme: themeData,
//       builder: (context, widget) {
//         streamChatThemeData: StreamChatThemeData.fromTheme(themeData);
//         return StreamChat(
//           streamChatThemeData: StreamChatThemeData.fromTheme(themeData),
//           client: client,
//           child: widget,
//         );
//       },
//       home: StreamChannel(
//         channel: channel,
//         child: const ChannelPage(),
//       ),
//     );
//   }
// }
//
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



class Interface extends StatefulWidget {
  final StreamChatClient client;
  final Channel channel;
   Interface({Key? key,required this.client,
   required this.channel}) : super(key: key);

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {


  connectuser() async{
    final client = StreamChatClient(
      'b67pax5b2wdq',
      logLevel: Level.INFO,
    );

    await client.connectUser(
      User(id: 'chat-flutter'),
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
    );

    final channel = client.channel('messaging', id: 'flutterdevs');

    await channel.watch();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    connectuser();

  }

  @override
  Widget build(BuildContext context) {
    return StreamChannel(child: ChannelPage(), channel: widget.channel);
  }
}

