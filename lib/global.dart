import 'dart:typed_data';

class Global {
  static List Animals = [
    {
      "name": "TIGER",
      "image":
          "https://cdn.firstcry.com/education/2022/04/25155522/1378635314.jpg",
      "des":
          "The tiger is the largest living cat species and a member of the genus Panthera. It is most recognisable for its dark vertical stripes on orange fur with a white underside. An apex predator, it primarily preys on ungulates, such as deer and wild boar.",
    },
    {
      "name": "ALLIGATOR",
      "image":
          "https://media.wired.com/photos/59326eb044db296121d6afc3/191:100/w_1280,c_limit/Gator-2.jpg",
      "des":
          "An alligator is a large reptile in the Crocodilia order in the genus Alligator of the family Alligatoridae. The two extant species are the American alligator and the Chinese alligator.",
    },
    {
      "name": "BEAR",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/2010-kodiak-bear-1.jpg/1200px-2010-kodiak-bear-1.jpg",
      "des":
          "Bears are carnivoran mammals of the family Ursidae. They are classified as caniforms, or doglike carnivorans. Although only eight species of bears are extant,",
    },
    {
      "name": "BLUE WHALE",
      "image":
          "https://www.antarctica.gov.au/site/assets/files/45670/ia40342.1920x768.jpg?f=037035",
      "des":
          "The blue whale is a marine mammal and a baleen whale. Reaching a maximum confirmed length of 29.9 meters and weighing up to 199 tonnes, it is the largest animal known to have ever existed.",
    },
    {
      "name": "HYENA",
      "image":
          "https://res.cloudinary.com/roundglass/image/upload/w_1104,h_736,c_fill/q_auto:best,f_auto/v1604402533/roundglass/sustain/velavadar-striped-hyena-lead-vickey-chauhanshutterstock-8_vzjhcy.jpg",
      "des":
          "Hyenas, or hyaenas, are feliform carnivoran mammals of the family Hyaenidae. With only four extant species, it is the fifth-smallest family in the Carnivora and one of the smallest in the class Mammalia.",
    },
  ];
  static String animalDataTableName = "animal";
  static String animalDesc =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exer ?";
}

class AnimalDB {
  final String name;
  final String desc;
  final Uint8List image;

  AnimalDB({
    required this.name,
    required this.desc,
    required this.image,
  });

  factory AnimalDB.fromData(Map data) {
    return AnimalDB(
        name: data['name'], desc: data['description'], image: data['image']);
  }
}
