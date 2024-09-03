import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quote.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/quotes_provider.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  QuoteCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    final quotesProvider = Provider.of<QuotesProvider>(context, listen: false);
    final isFavorite = quotesProvider.favoriteQuotes.contains(quote);

    return SingleChildScrollView(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white38,
        ),
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                quote.text,
                style: GoogleFonts.lora(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
              Text(
                '- ${quote.author}',
                style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
                textAlign: TextAlign.right,
              ),
              IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  quotesProvider.toggleFavorite(quote);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
