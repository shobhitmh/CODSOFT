class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  // Convert a Quote object to a Map object
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'author': author,
    };
  }

  // Create a Quote object from a Map object
  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      text: map['text'],
      author: map['author'],
    );
  }
}
