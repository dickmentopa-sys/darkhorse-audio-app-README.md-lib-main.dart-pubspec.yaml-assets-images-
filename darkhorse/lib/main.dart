import 'package:flutter/material.dart';

void main() => runApp(const DarkHorseApp());

const purple = Color(0xFF8957FF);
const navy = Color(0xFF101329);

class DarkHorseApp extends StatelessWidget {
  const DarkHorseApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'DARKHORSE',
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: navy,
      colorScheme: ColorScheme.fromSeed(
        seedColor: purple,
        brightness: Brightness.dark,
      ),
    ),
    home: const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        '🐎 DARKHORSE',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: navy,
      actions: const [Icon(Icons.notifications_none), SizedBox(width: 18)],
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'WELCOME TO DARKHORSE',
          style: TextStyle(color: purple, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Connect. Chat. Make Friends.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor: purple,
            padding: const EdgeInsets.all(17),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const VoiceRoom()),
          ),
          icon: const Icon(Icons.add),
          label: const Text('CREATE VOICE ROOM'),
        ),
        const SizedBox(height: 28),
        const Text(
          'POPULAR VOICE ROOMS',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        roomCard(
          context,
          'Friends Hangout',
          '12 people listening',
          Icons.people,
        ),
        roomCard(
          context,
          'Music & Chill',
          '8 people listening',
          Icons.music_note,
        ),
        roomCard(
          context,
          'Meet New Friends',
          '5 people listening',
          Icons.favorite,
        ),
      ],
    ),
  );
  Widget roomCard(
    BuildContext context,
    String name,
    String people,
    IconData icon,
  ) => Card(
    color: const Color(0xFF202541),
    margin: const EdgeInsets.only(bottom: 14),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: purple,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(name),
      subtitle: Text(people),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const VoiceRoom()),
      ),
    ),
  );
}

class VoiceRoom extends StatefulWidget {
  const VoiceRoom({super.key});
  @override
  State<VoiceRoom> createState() => _VoiceRoomState();
}

class _VoiceRoomState extends State<VoiceRoom> {
  bool muted = true;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('VOICE ROOM')),
    body: Column(
      children: [
        const SizedBox(height: 24),
        const Text(
          'DARKHORSE HANGOUT',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('8 MICROPHONE SEATS', style: TextStyle(color: purple)),
        const SizedBox(height: 28),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(18),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 22,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) => Column(
              children: [
                CircleAvatar(
                  radius: 29,
                  backgroundColor: index == 0
                      ? purple
                      : const Color(0xFF303653),
                  child: Icon(
                    index == 0 ? Icons.person : Icons.mic_none,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  index == 0 ? 'Host' : 'Seat ${index + 1}',
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ),
        const Text(
          'Prototype: live audio not connected yet',
          style: TextStyle(color: Colors.white54),
        ),
        const SizedBox(height: 15),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: purple,
            padding: const EdgeInsets.all(18),
          ),
          onPressed: () => setState(() => muted = !muted),
          icon: Icon(muted ? Icons.mic_off : Icons.mic),
        ),
        const SizedBox(height: 10),
        Text(muted ? 'MICROPHONE MUTED' : 'MIC BUTTON ON'),
        const SizedBox(height: 25),
      ],
    ),
  );
}
