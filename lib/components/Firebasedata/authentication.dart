
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'exception.dart';

class AuthRepo extends GetxController{
static AuthRepo get to => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if(user == null){
      Get.offAllNamed('/');
    }else{
      Get.offAllNamed('/main_lauout');
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      firebaseUser.value != null ? Get.offAllNamed('/main_layout') : Get.toNamed('/');
      } on FirebaseAuthException catch (e) {
         final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
        print('FirebaseAuthException ${ex.message}');
        throw ex;
   
  } catch (e) {
     const ex = SignUpWithEmailAndPasswordFailure();
    print ('Exception ${ex.message}');
    throw ex;
    
  }
  }
  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try
    {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      } on FirebaseAuthException catch (e) {
       
  } catch (e) {
   
  }
  }
  Future<void> signOut() async {
    try
    {
      await _auth.signOut();
      } on FirebaseAuthException catch (e) {
   
  } catch (e) {
    
  }
  }

}

