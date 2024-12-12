import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _posts = [];
  int? _editingIndex;

  void _addOrUpdatePost() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        if (_editingIndex != null) {
          _posts[_editingIndex!] = _controller.text;
          _editingIndex = null;
        } else {
          _posts.insert(0, _controller.text);
        }
        _controller.clear();
      });
    }
  }

  void _editPost(int index) {
    setState(() {
      _editingIndex = index;
      _controller.text = _posts[index];
    });
  }

  void _deletePost(int index) {
    setState(() {
      _posts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bảng tin'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Miêu tả chuyến đi của bạn...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ),
          ElevatedButton(
            onPressed: _addOrUpdatePost,
            child: Text(_editingIndex != null ? 'Update' : 'Post'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            _posts[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _editPost(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deletePost(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
