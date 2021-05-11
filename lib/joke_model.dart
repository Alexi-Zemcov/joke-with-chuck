class Joke {
  final String? iconUrl;
  final String? id;
  final String? url;
  final String? value;

  Joke(
      {required this.iconUrl,
      required this.id,
      required this.url,
      required this.value});

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        iconUrl: json['icon_url'],
        id: json['id'],
        url: json['url'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_url'] = this.iconUrl;
    data['id'] = this.id;
    data['url'] = this.url;
    data['value'] = this.value;
    return data;
  }
}

const rawJson = '''{
"icon_url" : "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
"id" : "KtGXt-PRQxKA6AcJyEvBeg",
"url" : "",
"value" : "The world used to be round o that when people go to the bottom of the Earth they fall off but then Chuck Norris stepped on a globe and its all flat and so it the world THANK YOU,CHUCK!"
}''';
