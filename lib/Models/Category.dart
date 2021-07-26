import 'package:flutter/material.dart';

class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
    this.hospitalName,
    this.doctorFirstName,
    this.doctorLastName,
    this.specialistType,
    this.specialistRating,
    this.specialistImage,
    this.categoryImage,
    this.doctorCategoryTitle,
    this.topRatedDoctorSRating,
    this.topRatedDoctorsName,
    this.topRatedDoctorsField,
    this.topRatedDoctorsImage,
    this.topRatedDoctorsExperience,
    this.topRatedDoctorsPatients,
  });

  String title;
  String hospitalName;
  int lessonCount;
  int money;
  double rating;
  String imagePath;
  String doctorFirstName;
  String doctorLastName;
  String specialistType;
  double specialistRating;
  String specialistImage;
  String categoryImage;
  String doctorCategoryTitle;
  double topRatedDoctorSRating;
  String topRatedDoctorsName;
  String topRatedDoctorsField;
  String topRatedDoctorsImage;
  String topRatedDoctorsExperience;
  String topRatedDoctorsPatients;

  static List<Category> serviceCategory = <Category>[
    Category(
      imagePath: 'assets/pregnantmother.png',
      title: 'Pregnant Mothers',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/Youths.png',
      title: 'Adults',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/child.png',
      title: 'Kids',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/granny.png',
      title: 'Elders',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularServicesList = <Category>[
    Category(
      imagePath: 'assets/doctor 3.png',
      title: 'Home Service',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor group 4.png',
      title: 'Monthly Check Up',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/doctor 4.png',
      title: 'Get a Family Doctor',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 7.png',
      title: 'Visit Our Branch',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/doctor 3.png',
      title: 'Children Vaccination',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 5.png',
      title: 'Make Enquiry',
      lessonCount: 12,
      money: 25,
      rating: 4.9,
    ),
  ];
  static List<Category> hospitals = <Category>[
    Category(
      imagePath: 'assets/doctor group 3.png',
      title: 'Rosevine\nHospital',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor group 1.png',
      title: 'Amazing Grace\nHospital',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/doctor 2.png',
      title: 'Simeone\nHospital',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 5.png',
      title: 'Shalom Specialist\nHospital',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/doctor 1.png',
      title: 'Janet Memorial\nHospital',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor group 3.png',
      title: 'Ihunanya\nHospital',
      lessonCount: 12,
      money: 25,
      rating: 4.9,
    ),
  ];
  static List<Category> doctorCredentials = <Category>[
    Category(
        doctorFirstName: 'Elijah',
        doctorLastName: 'Michael',
        specialistType: 'Kidney',
        hospitalName: 'Living Word',
        specialistRating: 3.8,
        specialistImage: 'assets/doctor 1.png'),
    Category(
        doctorFirstName: 'Uko',
        doctorLastName: 'Nestor',
        specialistType: 'Kidney',
        hospitalName: 'Rosevine',
        specialistRating: 5.0,
        specialistImage: 'assets/doctor 2.png'),
    Category(
        doctorFirstName: 'Obi',
        doctorLastName: 'Victor',
        specialistType: 'Kidney',
        hospitalName: 'St Michael',
        specialistRating: 4.0,
        specialistImage: 'assets/doctor 3.png'),
    Category(
        doctorFirstName: 'paul',
        doctorLastName: 'Barbara',
        specialistType: 'Kidney',
        hospitalName: 'Amazing Grace',
        specialistRating: 4.1,
        specialistImage: 'assets/doctor 4.png'),
    Category(
        doctorFirstName: 'Nancy',
        doctorLastName: 'Williams',
        specialistType: 'Kidney',
        hospitalName: 'Living Word',
        specialistRating: 4.9,
        specialistImage: 'assets/doctor 5.png'),
    Category(
        doctorFirstName: 'Susan',
        doctorLastName: 'Thomas',
        specialistType: 'Kidney',
        hospitalName: 'Living Word',
        specialistRating: 4.5,
        specialistImage: 'assets/doctor 6.png'),
  ];
  static List<Category> doctorCategories = <Category>[
    Category(
        doctorCategoryTitle: 'Cardiologist',
        categoryImage: 'assets/doctorheart.png'),
    Category(
        doctorCategoryTitle: 'Eyes', categoryImage: 'assets/doctoreye.png'),
    Category(
      doctorCategoryTitle: 'Pediatrician',
      categoryImage: 'assets/doctorpediatrician.png',
    ),
    Category(
        doctorCategoryTitle: 'Otolaryngologists',
        categoryImage: 'assets/doctorear.png'),
  ];
  static List<Category> topRatedDoctors = <Category>[
    Category(
        topRatedDoctorsName: 'Michael Bones',
        topRatedDoctorsField: 'Pediatrician',
        topRatedDoctorSRating: 4.1,
        topRatedDoctorsImage: 'assets/doctor 4.png',
        topRatedDoctorsExperience: '13 years',
        topRatedDoctorsPatients: '13k'
    ),
    Category(
        topRatedDoctorsName: 'James Streets',
        topRatedDoctorsField: 'Dentist',
        topRatedDoctorSRating: 4.4,
        topRatedDoctorsImage: 'assets/doctor 1.png',
        topRatedDoctorsExperience: '13 years',
        topRatedDoctorsPatients: '23k'
    ),
    Category(
        topRatedDoctorsName: 'Stephanie Sigma',
        topRatedDoctorsField: 'Oncologist',
        topRatedDoctorSRating: 4.7,
        topRatedDoctorsImage: 'assets/doctor 6.png',
        topRatedDoctorsExperience: '16 years',
        topRatedDoctorsPatients: '43k'
    ),
    Category(
        topRatedDoctorsName: 'Jason Hondo',
        topRatedDoctorsField: 'Kidney Specialist',
        topRatedDoctorSRating: 3.5,
        topRatedDoctorsImage: 'assets/doctor 5.png',
        topRatedDoctorsExperience: '9 Years',
        topRatedDoctorsPatients: '9k'
    ),
    Category(
        topRatedDoctorsName: 'Jason victor',
        topRatedDoctorsField: 'Cardiologist',
        topRatedDoctorSRating: 4.0,
        topRatedDoctorsImage: 'assets/doctor 2.png',
        topRatedDoctorsExperience: '9 Years',
        topRatedDoctorsPatients: '44k'

    ),
    Category(
        topRatedDoctorsName: 'Jim Woods',
        topRatedDoctorsField: 'Neurosurgeon',
        topRatedDoctorSRating: 4.5,
        topRatedDoctorsImage: 'assets/doctor 7.png',
        topRatedDoctorsExperience: '19 Years',
        topRatedDoctorsPatients: '12k'
    ),
  ];
  static List<Category> allCategoryTabBarView = <Category>[
    Category(
      imagePath: 'assets/doctor 5.png',
      topRatedDoctorsField: 'Neurosurgeon',
      topRatedDoctorsExperience: '13 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 1.png',
      topRatedDoctorsField: 'Dermatologist',
      topRatedDoctorsExperience: '7 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 6.png',
      topRatedDoctorsField: 'Otolaryngologists',
      topRatedDoctorsExperience: '16 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 7.png',
      topRatedDoctorsField: 'Oncologist',
      topRatedDoctorsExperience: '14 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 1.png',
      topRatedDoctorsField: 'Dermatologist',
      topRatedDoctorsExperience: '15 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 4.png',
      topRatedDoctorsField: 'Psychiatrist',
      topRatedDoctorsExperience: '12 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 1.png',
      topRatedDoctorsField: 'Optician',
      topRatedDoctorsExperience: '28 yrs',
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/doctor 3.png',
      topRatedDoctorsField: 'Cardiologist',
      topRatedDoctorsExperience: '12 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 7.png',
      topRatedDoctorsField: 'Oncologist',
      topRatedDoctorsExperience: '6 yrs',
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/doctor 3.png',
      topRatedDoctorsField: 'Dentist',
      topRatedDoctorsExperience: '17 yrs',
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/doctor 5.png',
      topRatedDoctorsField: 'Pediatrician',
      topRatedDoctorsExperience: '10 yrs',
      money: 25,
      rating: 4.9,
    ),
  ];
}
