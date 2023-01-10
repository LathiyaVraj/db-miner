import 'package:flutter/material.dart';

import '../components/author..dart';
import '../components/cat.dart';
import '../components/drawer.dart';
import '../components/opt.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: drawer(context: context),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black));
        }),
        title: const Text("Life quotes", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: Colors.yellow.shade800)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: Colors.red)),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        CatOrAuthArgs args = CatOrAuthArgs(
                            title: 'Categories', isAuthorCat: false);

                        Navigator.of(context)
                            .pushNamed('category_and_auth', arguments: args);
                      },
                      child: options(
                        color: const Color(0xffA45584),
                        icon: Icons.grid_view,
                        text: "Categories",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: "Pic", isAuthCat: false, name: 'pic');
                        Navigator.of(context)
                            .pushNamed('quote_page', arguments: args);
                      },
                      child: options(
                        color: const Color(0xff7589C8),
                        icon: Icons.image_outlined,
                        text: "Pic Quotes",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Arguments args = Arguments(
                            title: 'Latest', isAuthCat: false, name: 'pic');

                        Navigator.of(context)
                            .pushNamed('quote_page', arguments: args);
                      },
                      child: options(
                        color: const Color(0xffB99041),
                        icon: Icons.sunny,
                        text: "Latest",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: options(
                        color: const Color(0xff6C9978),
                        icon: Icons.menu_book_sharp,
                        text: "Articles",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Most Popular",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Happiness',
                                isAuthCat: false,
                                name: 'happiness');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Happiness',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Love', isAuthCat: false, name: 'love');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Love',
                              context: context))),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Success',
                                isAuthCat: false,
                                name: 'success');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Success',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Wisdom',
                                isAuthCat: false,
                                name: 'wisdom');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Wisdom',
                              context: context))),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Quotes by Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      CatOrAuthArgs args = CatOrAuthArgs(
                          title: 'Categories', isAuthorCat: false);

                      Navigator.of(context)
                          .pushNamed('category_and_auth', arguments: args);
                    },
                    child: const Text(
                      "View All >",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Ambition',
                                isAuthCat: false,
                                name: 'ambition');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Ambition',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Business',
                                isAuthCat: false,
                                name: 'business');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Business',
                              context: context))),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Friendship',
                                isAuthCat: false,
                                name: 'friendship');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Friendship',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Humor',
                                isAuthCat: false,
                                name: 'humor');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: category(
                              height: height,
                              category: 'Humor',
                              context: context))),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Quotes by Author",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      CatOrAuthArgs args =
                          CatOrAuthArgs(title: 'Authors', isAuthorCat: true);
                      Navigator.of(context)
                          .pushNamed('category_and_auth', arguments: args);
                    },
                    child: const Text(
                      "View All >",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Elon Musk',
                                isAuthCat: true,
                                name: 'elon_musk');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: authorBox(
                              height: height,
                              author: "Elon Musk",
                              color: const Color(0xffF5DBCE)))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Albert Einstein',
                                isAuthCat: true,
                                name: 'albert_einstein');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: authorBox(
                              height: height,
                              author: "Albert Einstein",
                              color: const Color(0xffFDE490)))),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Thomas Aquinas',
                                isAuthCat: true,
                                name: 'thomas_aquinas');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: authorBox(
                              height: height,
                              author: "Thomas\nAquinas",
                              color: const Color(0xffB8D7E9)))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Marianne Williamson',
                                isAuthCat: true,
                                name: 'marianne_williamson');
                            Navigator.of(context)
                                .pushNamed('quote_page', arguments: args);
                          },
                          child: authorBox(
                              height: height,
                              author: "Marianne Williamson",
                              color: const Color(0xffF6CDDF)))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatOrAuthArgs {
  final String title;
  final bool isAuthorCat;

  CatOrAuthArgs({
    required this.title,
    required this.isAuthorCat,
  });
}

class Arguments {
  final String title;
  final String name;
  final bool isAuthCat;

  Arguments({required this.title, required this.isAuthCat, required this.name});
}
