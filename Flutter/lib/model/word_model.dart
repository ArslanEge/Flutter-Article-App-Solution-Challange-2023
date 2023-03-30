class WordModel {
    WordModel({
        required this.data,
    });

    final List<Datum> data;

    factory WordModel.fromJson(Map<String, dynamic> json){ 
        return WordModel(
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.word,
        required this.article,
        required this.id,
    });

    final String? word;
    final String? article;
    final int? id;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            word: json["word"],
            article: json["article"],
            id: json["id"],
        );
    }

}
