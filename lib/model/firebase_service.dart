import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class QuotesModel extends ChangeNotifier {
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 Future<void> fetchQuotes() async {
    final quotesQuery = _firestore.collection('quotes');
    final querySnapshot = await quotesQuery.get();
    final quotes = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
 }

 // create a quote
 Future<void> createQuote(Map<String, dynamic> quote) async {
    await _firestore.collection('quotes').add(quote);
    notifyListeners();
 }

 // update a quote
 Future<void> updateQuote(String id, Map<String, dynamic> quote) async {
    await _firestore.collection('quotes').doc(id).update(quote);
    notifyListeners();
 }

 // delete a quote
 Future<void> deleteQuote(String id) async {
    await _firestore.collection('quotes').doc(id).delete();
    notifyListeners();
 }
}