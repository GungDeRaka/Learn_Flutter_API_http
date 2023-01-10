// ignore_for_file: public_member_api_docs, sort_constructors_first
class Sample {
  final String? name;
  final String? programStudi;
  final List? hobies;
  final int? age;
  final Github github;
  final List<Articles>? articles;

  Sample({
    this.name,
    this.programStudi,
    this.hobies,
    this.age,
    required this.github,
    required this.articles,
  });
//factory constructor, when u call class Sample it will return same object even u use it mant times
  factory Sample.fromJsom(Map<String, dynamic> json) {
    return Sample(
      //make sure the string inside of square bracket is correct with json key
      name: json["name"] ?? "",
      programStudi: json["programStudi"] ?? "kungfu",
      age: json["age"] ?? 0,
      //! there are 2 ways to call a json list (look to [hobies:])
      // hobies: json["hobies"] ?? [],
      hobies: List<String>.from(json["hobies"] ?? []),
      github: Github.fromJson(json["github"]),
      //? method .map will transform your data into some map,
      //? learn more about dart collection
      articles: List<Articles>.from(
        //! note: remember to add the generic and u can use a class as a generic
        json["articles"].map((article) => Articles.fromJson(article)) ?? [],
      ),
    );
  }
//The following article explains why we have to override the method to string
//https://medium.com/@ditateum/override-method-tostring-tapi-tidak-tahu-fungsinya-f9bcb58953d8
  @override
  String toString() {
    return 'Sample(name: $name, programStudi: $programStudi, hobies: $hobies, age: $age, github: $github, articles: $articles)';
  }
}

class Github {
  final String userName;
  final int repositories;
  final bool isStudent;

  Github({
    required this.userName,
    required this.repositories,
    required this.isStudent,
  });

  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(
        userName: json["userName"] ?? "",
        repositories: json["repositories"] ?? 0,
        isStudent: json["isStudent"] ?? false);
  }

  @override
  String toString() =>
      'Github(userName: $userName, repositories: $repositories, isStudent: $isStudent)';
}

class Articles {
  int? id;
  String? title;
  String? subtitle;

  Articles({
    this.id,
    this.title,
    this.subtitle,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        subtitle: json["subtitle"] ?? "");
  }

  @override
  String toString() => 'Articles(id: $id, title: $title, subTitle: $subtitle)';
}
