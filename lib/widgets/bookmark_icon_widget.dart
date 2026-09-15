import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourism.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Tourism tourism;

  const BookmarkIconWidget({super.key, required this.tourism});

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  late bool _isBookmarked;

  // Kata kunci late pada kode di atas dapat diartikan “tertunda”. Maksudnya, ia akan menunda inisialisasi variabel sampai diakses pertama kalinya. Hal ini memungkinkan kita untuk mendeklarasikan variabel tanpa memberikan nilai awal. Nantinya, ia tetap perlu diinisialisasi dahulu sebelum dipakai oleh widget

  @override
  void initState() {
    final tourismInList = bookmarkTourismList.where(
      (element) => element.id == widget.tourism.id,
    );

    setState(() {
      if (tourismInList.isNotEmpty) {
        _isBookmarked = true;
      } else {
        _isBookmarked = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (_isBookmarked) {
            bookmarkTourismList.removeWhere(
              ((element) => element.id == widget.tourism.id),
            );
          } else {
            bookmarkTourismList.add(widget.tourism);
          }

          _isBookmarked = !_isBookmarked;
        });
      },
      icon: Icon(
        _isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_add_outlined,
        color: _isBookmarked ? Colors.amber : null,
      ),
    );
  }
}
