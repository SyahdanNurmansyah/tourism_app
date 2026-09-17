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

  // Kata kunci late pada kode di atas dapat diartikan “tertunda”. Maksudnya, ia akan menunda inisialisasi variabel sampai diakses pertama kalinya. Hal ini memungkinkan kita untuk mendeklarasikan variabel tanpa memberikan nilai awal. Nantinya, ia tetap perlu diinisialisasi dahulu sebelum dipakai oleh widget.

  @override
  void initState() {
    // DIGANTI PROVIDER

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

    // NOTE: Tidak boleh menggunakan methode context.watch<T>() untuk mengamati state di dalam initState karena dapat menyebabkan error. Ini karena initSte hanya dipanggil seklai selama lifecycle, yaitu saat pertama kali widget diinisialisasi.

    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    // Di sisi lain: Method iniState tidak bisa menjalankan proses asycn-await. Jadi, bisa memanfaatkan Future.microtask untuk menjalankan aksi mengubah state di Provider atau yang berhubungan dengan proses asinkron.

    // Method MICROTAKS ini akan segera dijalankan setelah proses sinkron dieksekusi. Hal ini dapat menjaga jalannya kode sinkron dan menghindari potensi terjadinya error saat ada proses asinkron.

    Future.microtask(() {
      final tourismInList = bookmarkListProvider.checkItemBookmark(
        widget.tourism,
      );
      bookmarkIconProvider.isBookmarked = tourismInList;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // DIGANTI PROVIDER

        // setState(() {
        //   if (_isBookmarked) {
        //     bookmarkTourismList.removeWhere(
        //       ((element) => element.id == widget.tourism.id),
        //     );
        //   } else {
        //     bookmarkTourismList.add(widget.tourism);
        //   }

        //   _isBookmarked = !_isBookmarked;
        // });

        // Ubah aksi onPressed dengan menerapkan Provider yang kita punya. Dengan begitu, ikon dapat berubah secara fleksibel saat ia ditekan.

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
      icon: Icon(
        // Selanjutnya adalah mengubah ikon menjadi fleksibel. Kita bisa manfaatkan method extension watch untuk mendengarkan perubahan state boolean dari isBookmarked.

        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark_rounded
            : Icons.bookmark_add_outlined,
        color: context.watch<BookmarkIconProvider>().isBookmarked
            ? Colors.amber
            : null,
      ),
    );
  }
}
