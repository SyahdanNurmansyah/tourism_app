BEDAH KODE
Pada materi ini, sudah meneraplam tiga Provider untuk mengelola state dalam aplikasi, yaitu IndexNavProvider, Bookmark
ListProvider, BookmarkIconProvider. Ketiga Provider tersebut dibangun dengan membuat berkas baru dalam folder provider. Jadi, dengan menerapkan Provider, proses pembuatan logika bisnis dan tampilan UI berada pada berkas yang berbeda.

Lalu, ketika ingin membuat Provider, kita memnafaatkan ChangeNotifier untuk mengenkapsulasi state. Misalnya, kita ingin mengelola index pada bottom navigation bar. Anda perlu membuat kelas khusus bernama IndexNavProvider dengan meng-extend kelas ChangeNotifier. Selanjutnya, buat state dengan getter-setter yang diperlukan untuk mengubah dan mengaksesnya.

class IndeNavProvider extends ChangeNotifier {
    <!-- State -->
    int _indexBottomBar = 0;

    <!-- getter-setter -->
    int get indexBottomBar => _indexBottomBar;

    set setIndexBottoNavBar (int value) {
        _indexBottomBar = value;
        notifyListeners();
    }
}

Pada baguan setter atau method yang aka nmengubah nilai state(), pastikan Anda menjalankan method notifyListeners() untuk "mengabarkan" adanya perubahan nilai kepada widget yang mendengarkan. Jika terlewatkan, aplikasi tidak akan menunjukan perubahan UI karena widget tidak mendengar adanya panggilan perubahannya.

Tidak hanya getter-setter, Anda juga dapat membuat method khususnya yang mampu mengelola state sesuai dengan keinginan. Tidak harus mempunya getter-setter. Hal terpenting dari ChangeNotifier adalah ia akan mengelola state berdasarkan apa yang Anda jalankan, entah melalui getter-setter atau method lain.

Hal ini terjadi pada BookmarkListProvider. Di dalamnya memiliki state. _bookmarkList dan getter bookmarkList. Untuk mengelola sate, Anda dapat melakukan dengan cara menambahkan, menghapus, dan memeriksa item bookmark yang sudah terdaftar. Karena proses pengelolaan state cukup banyak. Anda dapat membuat method baru, yaitu addBookmark, removeBookmark, checkItemBookmark.

class BookmarkListProvider extends ChangeNotifier {

    <!-- State -->
    final List<Tourism> _bookmarkList = [];
    List<Tourism> get bookmarkList => _bookmarkList;
    
    <!-- 1. another method -->
    void addBookmark (Tourism value) {
        _bookmarkList.add(value);
        notifyListeners();
    }

    <!-- 2. another method --> 
    void removeBookmark(Tourism value) {
        _bookmarkList.removeWhere((element) => element.id == value.id);

        notifyListeners();
    }

    <!-- 3. another method --> 
    void checkItemBookmark (Tourism value) {

        final tourismInList = 
        _bookmarkList.where((element) => element.id == value.id);
        
        return tourismInList.isNotEmpty;
    }
}


Setelah membuat Provider, hal yang harus dilakukan adalah mengubah tampilan aplikasi berdasarkan state. Anda dapat memanfaatkan widget Consumer untuk me-rebuild child widget di dalamnya ketika ChangeNotifier memanggil notifyListeners(). State dapat diakses melalui argumen value (secara default) dari paramter bukld Consumer.


class MainScreen extends StatelessWidget {
 const MainScreen({super.key});
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Consumer<IndexNavProvider>(
       builder: (context, value, child) {
         return switch (value.indexBottomNavBar) {
           0 => const HomeScreen(),
           _ => const BookmarkScreen(),
         };
       },
     ),
     bottomNavigationBar: ...,
   );
 }
}


Selain widget Consumer, ada cara lain mendapatkan state ter-up-to-date, yaitu dengan memanfaatkan extension method watch/ Ia serupa dengan Provider.of<>(context, listen: false). Dengan extention method tersebut, kita bisa mendapatkan nilai state terbaru tanpa membuat widget. Hal ini sudah kita lakukan saat mengelola index untuk mendapatkan nilai state terbaru pada parameter currentIndex dalam BottomNavigationBar.

class MainScreen extends StatelessWidget {
 const MainScreen({super.key});
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ...,
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
       onTap: ...,
       items: const [
         ...,
       ],
     ),
   );
 }
}

Selain watch, ada extention method lainnya yang bisa kita pakai, yaitu read. Method ini serupa dengan Provider.of<>(context, listen: false) yang hanya membaca ChangeNotifier tanpa mengubah state melalui setter dalam Provider. Hal ini pun telah kita coba untuk mengubah index dengan nilai terbaru.

class MainScreen extends StatelessWidget {
 const MainScreen({super.key});
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ...,
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: ...,
       onTap: (index) {
         context.read<IndexNavProvider>().setIndextBottomNavBar = index;
       },
       items: const [
         ...,
       ],
     ),
   );
 }
}

Setelah sisi Provider dan UI telah disusun, Anda perlu memastikan state tersebut akan memiliki cakupan sebarapa besar. Ingat state dibagi menjadi dua jenis yaitu peripheral state dam app state.



