import 'package:flutter/cupertino.dart';

class Data {
  String title;
  String price;
  String desc;
  Image image;
  double review;

  Data({this.title, this.desc, this.image, this.price, this.review});
}

List<Data> getData = [
  Data(
      title: "App Development",
      desc:
          "DragonWare creates enterprise and consumer-level mobile applications that provide an engaging and sophisticated mobile experience on any device and platform you prefer at affordable rates.",
      price: "\$350",
      review: 3.5,
      image: Image.asset(
        "assets/images/app.jpg",
        fit: BoxFit.cover,
      )),
  Data(
    title: "Web Development",
    desc:
        "DragonWare is hub of web designing and development services for businesses across the globe. \n \n Web development is the work involved in developing a website for the Internet or an intranet. Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services.",
    price: "\$450",
    review: 3.8,
    image: Image.asset(
      "assets/images/web.png",
      fit: BoxFit.cover,
    ),
  ),
  Data(
      title: "UI/UX Design",
      desc:
          "DragonWare's exclusive UI/UX Designing Services are the ultimate boosters that turn concepts into functional products. We read your mind before you share your idea!",
      price: "\$350",
      review: 3.6,
      image: Image.asset(
        "assets/images/ui_ux_design.jpg",
        fit: BoxFit.cover,
      )),
];


class HomeData {
  String title;
  String desc;
  String image;

  HomeData({this.title, this.desc, this.image});
}
List<HomeData> gethomeData = [
  HomeData(
      title: "App Development",
      desc:
          "DragonWare creates enterprise and consumer-level mobile applications.",

      image: "assets/images/mobile.png"),
  HomeData(
    title: "Web Development",
    desc:
        "DragonWare is hub of web designing and development services.",
    image:  "assets/images/web_icon.png",
  ),
  HomeData(
      title: "UI/UX Design",
      desc:
          "DragonWare's exclusive UI/UX Designing Services.",
      image: "assets/images/ui_ux.png"),
];

class DataTech {
  String title;
  String subtitle;
  String price;
  String desc;
  Image image;
  double review;

  DataTech(
      {this.title,
      this.subtitle,
      this.desc,
      this.image,
      this.price,
      this.review});
}

List<DataTech> getTechnologyData = [
  DataTech(
      title: "Backend",
      subtitle: "Backend Development",
      desc:
          "Backend developers build code that allows a database and an application to communicate with one another. Backend developers take care and maintain the back-end of a website, Including databases, servers, and apps, and they control what you don't see",
      price: "\$350",
      review: 3.5,
      image: Image.asset(
        "assets/images/backend.jpg",
        fit: BoxFit.cover,
      )),
  DataTech(
    title: "Frontend",
    subtitle: "Frontend Development",
    desc:
        "Front-end web development, also known as client-side development is the practice of producing HTML, CSS and JavaScript for a website or Web Application so that a user can see and interact with them directly. The challenge associated with front end development is that the tools and techniques used to create the front end of a website change constantly and so the developer needs to constantly be aware of how the field is developing.",
    price: "\$450",
    review: 3.8,
    image: Image.asset(
      "assets/images/front_end_developer.jpg",
      fit: BoxFit.cover,
    ),
  ),
  DataTech(
      title: "Database",
      subtitle: "Database Development",
      desc:
          "Database development involves the development and maintenance of these systems, so that businesses can stay organised and use their data effectively. Databases help both business owners and employees to organise and track inventory, employees, and customers.",
      price: "\$350",
      review: 3.6,
      image: Image.asset(
        "assets/images/database_developer.jpg",
        fit: BoxFit.cover,
      )),
];

class DataAbout {
  String title;
  String job_title;
  String desc;
  Image image;

  DataAbout({this.title, this.job_title, this.desc, this.image});
}

List<DataAbout> getaboutData = [
  DataAbout(
      title: "JOHN",
      job_title: "CEO",
      desc:
          "John is responsible for managing a company's overall operations. This may include delegating and directing agendas, driving profitability, managing company organizational structure, strategy, and communicating with the board.",
      image: Image.asset(
        "assets/images/john.jpg",
        fit: BoxFit.cover,
      )),
  DataAbout(
    title: "PETER",
    job_title: "CTO",
    desc:
        "Peter is responsible for overseeing the development and dissemination of technology for external customers, vendors, and other clients to help improve and increase business. They may also deal with internal IT operations if a company is small and doesn't have a chief information officer.",
    image: Image.asset(
      "assets/images/peter.jpg",
      fit: BoxFit.cover,
    ),
  ),
  DataAbout(
      title: "UROOSA ALI",
      job_title: "PROJECT MANAGER",
      desc:
          "Uroosa is a professional who organizes, plans, and executes projects while working within restraints like budgets and schedules. Project managers are in charge of leading teams, defining goals, communicating with stakeholders, and seeing a project through to its closure. Whether running a marketing campaign, constructing a building, developing a computer system, or launching a new product, the project manager is responsible for the success or failure of the project.",
      image: Image.asset(
        "assets/images/uroosa.jpg",
        fit: BoxFit.cover,
      )),
];
