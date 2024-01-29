class Dogs {
  String? dogname;
  String? gender;
  String? coatdetails;
  String? country;
  String? age;
  String? weight;
  String? image;

  Dogs({
    this.dogname,
    this.gender,
    this.coatdetails,
    this.age,
    this.country,
    this.weight,
    this.image,
  });
}

List<Dogs> labrador = [
  Dogs(
    dogname: "Larry",
    gender: "Male",
    coatdetails: "Long",
    country: "American",
    age: "22",
    weight: "4 pound",
    image: "lib/images/german.png",
  ),
];

List<Dogs> samoyed = [
  Dogs(
    dogname: "Larry",
    gender: "Male",
    coatdetails: "Long",
    country: "American",
    age: "22",
    weight: "4 pound",
    image: "lib/images/samoyed.png",
  ),
];

List<Dogs> germanshepherd = [
  Dogs(
    dogname: "Larry",
    gender: "Male",
    coatdetails: "Long",
    country: "American",
    age: "22",
    weight: "4 pound",
    image: "lib/images/samoyed.png",
  ),
  Dogs(
    dogname: "Suzi",
    gender: "Female",
    coatdetails: "Mid",
    country: "German",
    age: "12",
    weight: "9 pound",
    image: "lib/images/labradore.png",
  ),
];
