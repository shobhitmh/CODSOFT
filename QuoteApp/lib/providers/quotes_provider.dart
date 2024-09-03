import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuotesProvider with ChangeNotifier {
  final List<Quote> _quotes = [
    // Add your initial list of quotes here
    Quote(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"),
    Quote(
        text:
            "Success is not final, failure is not fatal: It is the courage to continue that counts.",
        author: "Winston Churchill"),
    Quote(
        text: "Believe you can and you're halfway there.",
        author: "Theodore Roosevelt"),
    Quote(
        text: "The purpose of our lives is to be happy.", author: "Dalai Lama"),
    Quote(
        text: "Life is what happens when you're busy making other plans.",
        author: "John Lennon"),
    Quote(text: "Get busy living or get busy dying.", author: "Stephen King"),
    Quote(
        text:
            "You have within you right now, everything you need to deal with whatever the world can throw at you.",
        author: "Brian Tracy"),
    Quote(
        text: "The best way to predict the future is to invent it.",
        author: "Alan Kay"),
    Quote(
        text: "Do not watch the clock. Do what it does. Keep going.",
        author: "Sam Levenson"),
    Quote(
        text:
            "Keep your face always toward the sunshine—and shadows will fall behind you.",
        author: "Walt Whitman"),
    Quote(
        text:
            "What you get by achieving your goals is not as important as what you become by achieving your goals.",
        author: "Zig Ziglar"),
    Quote(
        text: "You miss 100% of the shots you don’t take.",
        author: "Wayne Gretzky"),
    Quote(
        text:
            "The only limit to our realization of tomorrow is our doubts of today.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text: "Life is 10% what happens to us and 90% how we react to it.",
        author: "Charles R. Swindoll"),
    Quote(
        text: "Act as if what you do makes a difference. It does.",
        author: "William James"),
    Quote(
        text:
            "Success usually comes to those who are too busy to be looking for it.",
        author: "Henry David Thoreau"),
    Quote(
        text: "Don't be afraid to give up the good to go for the great.",
        author: "John D. Rockefeller"),
    Quote(
        text: "I find that the harder I work, the more luck I seem to have.",
        author: "Thomas Jefferson"),
    Quote(
        text: "Opportunities don't happen. You create them.",
        author: "Chris Grosser"),
    Quote(text: "I failed my way to success.", author: "Thomas Edison"),
    Quote(
        text: "Don't watch the clock; do what it does. Keep going.",
        author: "Sam Levenson"),
    Quote(
        text:
            "You don't have to be great to start, but you have to start to be great.",
        author: "Zig Ziglar"),
    Quote(
        text:
            "Motivation is what gets you started. Habit is what keeps you going.",
        author: "Jim Rohn"),
    Quote(
        text: "The future depends on what you do today.",
        author: "Mahatma Gandhi"),
    Quote(
        text: "The secret of getting ahead is getting started.",
        author: "Mark Twain"),
    Quote(
        text: "The best revenge is massive success.", author: "Frank Sinatra"),
    Quote(
        text: "Success is not in what you have, but who you are.",
        author: "Bo Bennett"),
    Quote(
        text: "Don't wait for opportunity. Create it.",
        author: "George Bernard Shaw"),
    Quote(
        text:
            "You are never too old to set another goal or to dream a new dream.",
        author: "C.S. Lewis"),
    Quote(
        text:
            "Try not to become a man of success. Rather become a man of value.",
        author: "Albert Einstein"),
  ];

  // This list will only contain favorite quotes
  List<Quote> _favoriteQuotes = [];

  List<Quote> get quotes => _quotes;

  List<Quote> get favoriteQuotes => _favoriteQuotes;

  void toggleFavorite(Quote quote) {
    if (_favoriteQuotes.contains(quote)) {
      _favoriteQuotes.remove(quote);
    } else {
      _favoriteQuotes.add(quote);
    }
    notifyListeners();
  }

  // Clear or add functions for better state management
  void clearFavorites() {
    _favoriteQuotes.clear();
    notifyListeners();
  }
}
