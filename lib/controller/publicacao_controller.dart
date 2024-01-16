import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class PublicacaoController {

  Future<String?> uploadImage(PickedFile pickedFile) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');

    UploadTask task = FirebaseStorage.instance.ref().child('publicacoes/images').child(
      DateTime.now().microsecondsSinceEpoch.toString()
    ).putData(await pickedFile.readAsBytes(), metadata);

    TaskSnapshot taskSnapshot = await task.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}