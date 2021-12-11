import 'package:app_comics/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
  final FirebaseAuth _auth;

  AuthRepository({FirebaseAuth? auth})
      :_auth = auth ?? FirebaseAuth.instance;

  Future<UserModel> signUp (String email, String pass, String? name) async{
    UserModel userModel=UserModel(email: null, displayName: null, uid: null);
    await _auth.createUserWithEmailAndPassword(email: email, password: pass).then((value)
    async {
      await value.user!.updateDisplayName(name);
      userModel= UserModel(email:value.user!.email, uid: value.user!.displayName, displayName: value.user!.uid );
    });
    return userModel;
  }

  Future<UserCredential> signInWithCredentials(String email , String pass)  {
    return  _auth.signInWithEmailAndPassword(email: email, password: pass);
  }

  bool isSignedIn() {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

  Future<UserModel> getUser() async{
    UserModel userModel= UserModel(email: '', displayName: '', uid: '');
    userModel.displayName=_auth.currentUser!.displayName;
    userModel.email=_auth.currentUser!.email;
    userModel.uid=_auth.currentUser!.uid;
    return userModel;
  }
}