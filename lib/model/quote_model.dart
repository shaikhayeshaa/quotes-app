class Quote {
  final String quote;
  final String author;
  final String category;

  Quote({required this.quote, required this.author, required this.category});

  Quote.fromJson(Map<String, dynamic> json)
      :
        quote = json['quote'],
        author = json['author'],
        category = json['category'];
        
}
