import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../model/entities/treinamento.dart';

class TreinamentoController{
  List<Treinamento> listaDeTreinamentos = [];

  Future<String?> uploadImage(PickedFile pickedFile) async {

    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');

    UploadTask task = FirebaseStorage.instance.ref().child('treinamentos/images').child(
        DateTime.now().microsecondsSinceEpoch.toString()
    ).putData(await pickedFile.readAsBytes(), metadata);

    TaskSnapshot taskSnapshot = await task.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  Future<String?> uploadPdf(FilePickerResult pickedFile) async {

    SettableMetadata metadata = SettableMetadata(contentType: 'application/pdf');

    Uint8List? pdfBytes = pickedFile.files.first.bytes;

    UploadTask task = FirebaseStorage.instance.ref().child('treinamentos/pdfs').child(
        DateTime.now().microsecondsSinceEpoch.toString()
    ).putData(pdfBytes!, metadata);

    TaskSnapshot taskSnapshot = await task.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

}