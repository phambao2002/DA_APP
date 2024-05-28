import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void signUp(String email, String password, String displayName,
    BuildContext context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': displayName,
        'email': email,
        // Thêm các trường thông tin khác nếu cần
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tạo tài khoản mới thành công!')),
      );
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Email này đã được sử dụng cho một tài khoản khác.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đã xảy ra lỗi: ${e.message}')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã xảy ra lỗi: $e')),
    );
  }
}
