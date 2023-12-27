import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intranet_maispet/model/entities/sistema.dart';

class SistemaController {

  List<Sistema> sistemas = [];

  Future<String?> uploadImage(PickedFile pickedFile) async {

    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');

    UploadTask task = FirebaseStorage.instance.ref().child('sistemas').child(
      DateTime.now().microsecondsSinceEpoch.toString()
    ).putData(await pickedFile.readAsBytes(), metadata);

    TaskSnapshot taskSnapshot = await task.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}



