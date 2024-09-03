import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/screens/favorites_screen.dart';
import 'package:share_plus/share_plus.dart'; // Import the share_plus package
import '../providers/quotes_provider.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quotesProvider = Provider.of<QuotesProvider>(context);
    final allQuotes = quotesProvider.quotes;

    // Check if allQuotes is not empty before picking a random quote
    final randomQuote =
        allQuotes.isNotEmpty ? (allQuotes..shuffle()).first : null;

    /*  appBar: GradientAppBar(
    title: Text('Flutter'),
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.purple, Colors.red],
    ),
  ), */

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.textsms,
              size: 80,
            ),
            SizedBox(
              height: 80,
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 40,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 40,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavoritesScreen()));
              },
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text(
                'Favorite Quote',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Quote App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: randomQuote != null
                ? QuoteCard(quote: randomQuote) // Display the random quote
                : Text(
                    'No quotes available at the moment.',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ), // Display a message if there are no quotes
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              quotesProvider.notifyListeners(); // Refresh the UI
            },
            heroTag: 'refreshButton', // Unique tag for the refresh button
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            child: Icon(Icons.share),
            onPressed: randomQuote != null
                ? () {
                    Share.share(
                        randomQuote.text); // Share the current quote text
                  }
                : null,
            heroTag: 'shareButton', // Unique tag for the share button
          ),
        ],
      ),
    );
  }
}
