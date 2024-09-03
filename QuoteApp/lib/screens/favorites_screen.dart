import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import '../providers/quotes_provider.dart';
import '../widgets/quote_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteQuotes = Provider.of<QuotesProvider>(context).favoriteQuotes;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Favorites Quotes',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: favoriteQuotes.isEmpty
          ? Center(child: Text('No favorite quotes yet.'))
          : ListView.builder(
              itemCount: favoriteQuotes.length,
              itemBuilder: (context, index) {
                return QuoteCard(quote: favoriteQuotes[index]);
              },
            ),
    );
  }
}
