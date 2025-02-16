import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:jawnnypoo/data/project.dart';
import 'package:jawnnypoo/nav.dart';
import 'package:jawnnypoo/ui/snackbar_helper.dart';
import 'package:jawnnypoo/ui/styles.dart';
import 'package:jawnnypoo/ui/ui_factory.dart';
import 'package:jawnnypoo/ui/urls.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  ProjectType _type = ProjectType.professional;
  List<Project> _projects = List.empty();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    Project.loadAll(context)
        .then((value) => _setProjects(value))
        .catchError(_onError);
  }

  void _setProjects(List<Project> projects) {
    setState(() {
      _projects = projects;
    });
  }

  void _changeProjectType(ProjectType type) {
    setState(() {
      _type = type;
    });
  }

  void _onError(Object error) {
    SnackBarHelper.show(context, "Something went wrong: $error");
  }

  @override
  Widget build(BuildContext context) {
    var rows = [
      nothing(),
      Container(
        margin: const EdgeInsets.all(24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Portfolio",
                style: logoStyle,
              ),
              markdown(
                  "Here is a sample of some work I've done, professionally and personally. I've also done tons of work as an open sourcerer, which is up on GitHub under both [Jawnnypoo](https://github.com/Jawnnypoo) and [Commit 451](https://github.com/Commit451). Android is my passion, but I also have experience in Typescript and Flutter (this site is created with Flutter!). Please reach out if you would like a more formal resume as a PDF."),
              verticalSeparator(),
              Row(
                children: [
                  _tab(ProjectType.professional),
                  _tab(ProjectType.personal),
                  _tab(ProjectType.library),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              )
            ]),
      ),
    ];
    var projectWidgets =
        _projects.where((element) => element.type == _type).map((project) {
      return _project(project);
    }).toList();
    rows.addAll(projectWidgets);
    return Scaffold(
        appBar: AppBar(
            title: GestureDetector(
          onTap: () {
            Nav.navigateToHome(context);
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child:
                    Image.network("$urlGravatar?s=100", width: 40, height: 40),
              ),
              horizontalSeparator(),
              const Text('John Carlson | @Jawnnypoo'),
            ],
          ),
        )),
        body: ListView(children: rows));
  }

  Widget _tab(ProjectType type) {
    String label = "";
    switch (type) {
      case ProjectType.professional:
        {
          label = "Professional";
        }
        break;

      case ProjectType.personal:
        {
          label = "Personal";
        }
        break;

      case ProjectType.library:
        {
          label = "Libraries";
        }
        break;
    }
    return InkWell(
        onTap: () {
          _changeProjectType(type);
        },
        child: Container(
            margin:
                const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
            child: Text(label,
                style: _type == type ? selectedTabStyle : tabStyle)));
  }

  Widget _project(Project project) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text content on the left
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: logoStyle,
                ),
                Text(
                  project.company,
                  style: companyStyle,
                ),
                verticalSeparator(),
                markdown(project.description),
              ],
            ),
          ),

          const SizedBox(width: 24), // Spacer between text and carousel

          // Carousel on the right
          Expanded(
            flex: 1,
            child: _carousel(project),
          ),
        ],
      ),
    );
  }

  Future<void> linkOnTapHandler(
    BuildContext context,
    String text,
    String? href,
    String title,
  ) async {
    Nav.openUrl(context, href);
  }

  Widget _carousel(Project project) {
    PageController _pageController = PageController(viewportFraction: 0.9);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: GestureDetector(
            onPanUpdate: (details) {
              // Allow mouse dragging on desktop
              _pageController.jumpTo(_pageController.offset - details.delta.dx);
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: project.images.length,
              physics: const BouncingScrollPhysics(),
              // Makes scrolling feel natural
              itemBuilder: (context, index) {
                String image = project.images[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Nav.navigateToImage(context, image);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16), // Optional
                      child: AspectRatio(
                        aspectRatio: 9 / 20, // Matches image aspect ratio
                        child: Image.asset(
                          "assets/images/$image",
                          width: MediaQuery.of(context).size.width *
                              0.9, // Ensures width fits
                          height: double.infinity,
                          fit: BoxFit.contain, // Ensures full image is visible
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Left Arrow (Previous)
        Positioned(
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 32, color: Colors.black),
            onPressed: () {
              if (_pageController.page! > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),

        // Right Arrow (Next)
        Positioned(
          right: 10,
          child: IconButton(
            icon:
                const Icon(Icons.arrow_forward, size: 32, color: Colors.black),
            onPressed: () {
              if (_pageController.page! < project.images.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget markdown(String markdown) {
    return MarkdownBody(
      data: markdown,
      styleSheet: MarkdownStyleSheet(p: bodyStyle),
      selectable: true,
      onTapLink: (String text, String? href, String title) =>
          linkOnTapHandler(context, text, href, title),
    );
  }
}
