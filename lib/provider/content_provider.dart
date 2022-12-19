import 'package:flutter/foundation.dart';

class ContentModel extends ChangeNotifier {
  late Map<String, String> _contents;

  setContent(int index) {
    switch (index) {
      case 0:
        _contents = HTMLContent.content;
        break;
      case 1:
        _contents = CSSContent.content;
        break;
      case 2:
        _contents = JavascriptContent.content;
        break;
      case 3:
        _contents = PHPContent.content;
        break;
      default:
        break;
    }
    notifyListeners();
  }

  Map<String, String> get contents => _contents;
}

class HTMLContent {
  static Map<String, String> content = {
    "Pengenalan HTML":
        "Hypertext Markup Language adalah bahasa markah standar untuk dokumen yang dirancang untuk ditampilkan di peramban internet. Ini dapat dibantu oleh teknologi seperti Cascading Style Sheets dan bahasa skrip lainnya seperti JavaScript, VBScript, dan PHP. Wikipedia",
    "Tag HTML":
        "Elemen HTML adalah jenis komponen dokumen HTML, salah satu dari beberapa jenis node HTML. Versi HTML pertama yang digunakan ditulis oleh Tim Berners-Lee pada tahun 1993 dan sejak itu telah ada banyak versi HTML. Versi yang paling umum digunakan adalah HTML 4.01, yang menjadi standar resmi pada Desember 1999. Wikipedia (Inggris)",
    "Paragraf":
        "Paragraf pada HTML dibuat dengan tag <p>. Selain tag ini, ada juga tag pendukung lain seperti <div>, <hr>, <br>, dan <pre>.",
    "Performatan Text":
        "Paragraf pada HTML dibuat dengan tag <p>. Selain tag ini, ada juga tag pendukung lain seperti <div>, <hr>, <br>, dan <pre>.",
    "Hyperlink":
        "Link atau Hyperlink adalah elemen HTML yang berfungsi menghubungkan suatu halaman web ke halaman web yang lain.",
    "List":
        "HTML lists allow web developers to group a set of related items in lists.",
    "Gambar":
        "Gambar dapat kita tambakan di HTML dengan menggunakan tag <img>. Tag ini memiliki atribut wajib, yakni src.",
    "Tabel":
        "Tag yang paling penting untuk diingat adalah tag <table>, <tr>, dan <td>. Sementara tag yang lain adalah tambahan (opsional), boleh digunakan boleh tidak.",
    "Form":
        " The HTML <input> element is the most used form element.An <input> element can be displayed in many ways, depending on the type attribute.",
    "Font":
        "The <font> tag was used in HTML 4 to specify the font face, font size, and color of text.",
    "Marquee":
        "The <marquee> tag is a container tag of HTML is implemented for creating scrollable text or images within a web page from either left to right or vice versa, or top to bottom or vice versa. But this tag has been deprecated in the new version of HTML, i.e., HTML 5.",
    "Youtube":
        "YouTube adalah sebuah situs web berbagi video yang dibuat oleh tiga mantan karyawan PayPal pada Februari 2005. Situs web ini memungkinkan pengguna mengunggah, menonton, dan berbagi video. Wikipedia"
  };
}

class CSSContent {
  static Map<String, String> content = {};
}

class JavascriptContent {
  static Map<String, String> content = {};
}

class PHPContent {
  static Map<String, String> content = {};
}
