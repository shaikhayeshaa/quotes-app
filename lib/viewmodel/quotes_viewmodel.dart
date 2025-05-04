import 'package:flutter/material.dart';
import 'package:quotes_app/model/quote_model.dart';
import 'package:quotes_app/repository/quote_repo.dart';

class QuoteViewModel extends ChangeNotifier {
  final QuoteRepository _repository;

  QuoteViewModel(this._repository);

  Quote? _quote;
  bool _isLoading = false;

  Quote? get quote => _quote;
  bool get isLoading => _isLoading;

  Future<void> loadQuote() async {
    _isLoading = true;
    notifyListeners();

    try {
      _quote = await _repository.fetchQuote();
    } catch (e) {
      debugPrint('Error fetching quote: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
