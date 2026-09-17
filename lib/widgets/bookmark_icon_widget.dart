import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/models/tourism.dart';
import 'package:tourism_app/provider/detail/bookmark_list_provider.dart';
import 'package:tourism_app/provider/icon/bookmark_icon_provider.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Tourism tourism;

  const BookmarkIconWidget({super.key, required this.tourism});

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  // late bool _isBookmarked;

  @override
  void initState() {
    // final tourismInList = bookmarkTourismList.where(
    //   (element) => element.id == widget.tourism.id,
    // );

    // setState(() {
    //   if (tourismInList.isNotEmpty) {
    //     _isBookmarked = true;
    //   } else {
    //     _isBookmarked = false;
    //   }
    // });

    // 1. Bedasarkan BookmarkIconProvider, kita mengubah proses pengecekannya seperti ini:

    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    // Future.microtask: Serupa dengan async-await untuk menjalankan aksi megnubah state di Provider atau yang berubungan dengan proses asinkron. Method microtask ini akan segera dijalankan setelah proses sinkron dieksekusi. Hal ini dapat menjaga jalannya kode sinkron dan menghindari potensi terjadinya error saat ada proses asinkron.

    Future.microtask(() {
      final tourismInList = bookmarkListProvider.checkItemBookmark(
        widget.tourism,
      );

      bookmarkIconProvider.isBookmarked = tourismInList;
    });

    // NOTE: Kita tidak boleh menggunakan method context.watch<T>() untuk mengamati sate di dalam initSate. Ini karena inisTate hanya dipanggil sekali selama lifecycle, yaitu saat pertama kali widget diinisialisasi. Dikarenakan juga dapat menyebabkan error karena ia akan terus-menerus memantau perubahan sate yang seharusnya tidak terjadi selama inisialisasi widget.

    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // 2. Ubah aksi onPressed dengan menerapkan Provider yang kita punya. Dengan begitu, ikon dapat berubah secara fleksible saat ditekan.
      onPressed: () {
        // setState(() {
        //   if (_isBookmarked) {
        //     bookmarkTourismList.removeWhere(
        //       (element) => element.id == widget.tourism.id,
        //     );
        //   } else {
        //     bookmarkTourismList.add(widget.tourism);
        //   }
        //   _isBookmarked = !_isBookmarked;
        // });

        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();

        final isBookmark = bookmarkIconProvider.isBookmarked;

        if (!isBookmark) {
          bookmarkListProvider.addBookmark(widget.tourism);
        } else {
          bookmarkListProvider.removeBookmark(widget.tourism);
        }

        bookmarkIconProvider.isBookmarked = !isBookmark;
      },

      // 3. Mengubah icon menjadi fleksible dan memanfaatkan method extention watch.
      icon: Icon(
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark_rounded
            : Icons.bookmark_border_outlined,

        color: context.watch<BookmarkIconProvider>().isBookmarked
            ? Colors.amber
            : null,
      ),
    );
  }
}
