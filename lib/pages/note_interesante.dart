import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteInteresante extends StatefulWidget {
  const NoteInteresante({super.key});

  @override
  _NoteInteresanteState createState() => _NoteInteresanteState();
}

class _NoteInteresanteState extends State<NoteInteresante> {
  final TextEditingController _noteController = TextEditingController();
  final List<Map<String, String>> _notes = [];

  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      final String now =
          DateFormat('EEEE, dd MMMM yyyy HH:mm').format(DateTime.now());
      setState(() {
        _notes.add({'text': _noteController.text, 'date': now});
        _noteController.clear();
      });
    }
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            color: const Color(0xFFFFF4CC),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Are you sure you want to delete this note?',
                  style: TextStyle(
                    fontFamily: 'Belgrano',
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _notes.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFDDE55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          fontFamily: 'Belgrano',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Belgrano',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes',
            style: TextStyle(fontFamily: 'Belgrano', fontSize: 20)),
        centerTitle: true,
        backgroundColor:
            const Color(0xFFFEEFAD), // Matches the background color
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color(0xFFFEEFAD), // Background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF4CC), // Light accent for input background
                ),
                child: TextField(
                  controller: _noteController,
                  style: const TextStyle(fontFamily: 'Belgrano'),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    labelText: 'Write a note',
                    labelStyle: TextStyle(
                      fontFamily: 'Belgrano',
                      color: Color(0xFFFCC737),
                    ),
                    prefixIcon: Icon(Icons.note_add, color: Color(0xFFFDDE55)),
                  ),
                  maxLines:
                      null, // This allows the TextField to expand with new lines
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _addNote,
              icon: const Icon(Icons.save),
              label: const Text('Add Note',
                  style: TextStyle(fontFamily: 'Belgrano')),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFDDE55),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _notes.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.notes,
                            color: Color(0xFFFDDE55), size: 100),
                        const SizedBox(height: 10),
                        Text(
                          'No notes yet.',
                          style: TextStyle(
                              fontFamily: 'Belgrano',
                              color: Colors.grey.shade600,
                              fontSize: 18),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: _notes.length,
                      itemBuilder: (context, index) {
                        final note = _notes[index];
                        return Card(
                          color: const Color(0xFFFFF4CC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 3,
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Color(0xFFFDDE55),
                              child: Icon(Icons.notes, color: Colors.black),
                            ),
                            title: Text(
                              note['text']!,
                              style: const TextStyle(
                                fontFamily: 'Belgrano',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              note['date']!,
                              style: TextStyle(
                                fontFamily: 'Belgrano',
                                color: Colors.grey.shade600,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _confirmDelete(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
