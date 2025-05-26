import 'package:app/screens/search/widgets/anchor_tile.dart';
import 'package:app/screens/search/widgets/fire_animated_search_bar.dart';
import 'package:app/screens/search/widgets/my_search_anchor.dart';
import 'package:app/screens/search/widgets/search_header.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/algolia_exports.dart';
import 'package:shared/shared.dart';

class SearchScreen<T> extends StatefulWidget {
  final bool isFullScreen;
  final String hintText;
  final Widget Function(MySearchController controller)? builder;
  final String? filters;
  final (bool users, bool depatments, bool tasks) includeIndexes;

  const SearchScreen({
    super.key,
    this.builder,
    this.isFullScreen = true,
    required this.hintText,
    this.filters,
    required this.includeIndexes,
  });

  @override
  State<SearchScreen<T>> createState() => _SearchScreenState<T>();
}

class _SearchScreenState<T> extends State<SearchScreen<T>> {
  Future<List<dynamic>> _searchFuture = Future.value([]);

  void _initialize(String value) {
    if (value.isEmpty) {
      _searchFuture = Future.value([]);
      return;
    }
    _searchFuture = _fetch(value);
  }

  Future<List<dynamic>> _fetch(String query) async {
    try {
      if (query == '') {
        return [];
      }
      final includeIndexes = widget.includeIndexes;
      final usersFuture =
          includeIndexes.$1
              ? kAlgoliaClient
                  .searchIndex(
                    request: SearchForHits(
                      indexName: AlgoliaIndices.users.value,
                      query: query,
                      hitsPerPage: 10,
                      filters: widget.filters,
                    ),
                  )
                  .then((value) {
                    return value.hits.map((e) => UserModel.fromJson(e.toJson())).toList();
                  })
              : Future.value(<UserModel>[]);
      final departmentsFuture =
          includeIndexes.$2
              ? kAlgoliaClient
                  .searchIndex(
                    request: SearchForHits(
                      indexName: AlgoliaIndices.departments.value,
                      query: query,
                      hitsPerPage: 10,
                      filters: widget.filters,
                    ),
                  )
                  .then((value) {
                    return value.hits.map((e) => DepartmentModel.fromJson(e.toJson())).toList();
                  })
              : Future.value(<DepartmentModel>[]);
      final tasksFuture =
          includeIndexes.$3
              ? kAlgoliaClient
                  .searchIndex(
                    request: SearchForHits(
                      indexName: AlgoliaIndices.tasks.value,
                      query: query,
                      hitsPerPage: 10,
                      filters: widget.filters,
                    ),
                  )
                  .then((value) {
                    return value.hits.map((e) => TaskModel.fromJson(e.toJson())).toList();
                  })
              : Future.value(<TaskModel>[]);
      return Future.wait([usersFuture, departmentsFuture, tasksFuture]);
    } catch (e) {
      debugPrint("SearchError::: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FireAnimatedSearchBar(
      hintText: widget.hintText,
      isFullScreen: widget.isFullScreen,
      onChanged: (value) {
        setState(() {
          _initialize(value);
        });
      },
      builder: (context, controller) {
        return widget.builder != null
            ? widget.builder!(controller)
            : BaseEditor(
              required: false,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
              readOnly: true,
              canRequestFocus: false,
              onChanged: null,
              onTap: () {
                controller.openView();
              },
            );
      },
      resultsBuilder: (context, query) {
        if (query.isEmpty) {
          return const SizedBox.shrink();
        }
        return ImpededFutureBuilder(
          key: ValueKey(query),
          future: _searchFuture,
          onComplete: (context, snapshot) {
            final users = snapshot.data![0] as List<UserModel>;
            final departments = snapshot.data![1] as List<DepartmentModel>;
            final tasks = snapshot.data![2] as List<TaskModel>;
            if (users.isEmpty && departments.isEmpty && tasks.isEmpty) {
              return const SizedBox.shrink();
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: kScreenMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (users.isNotEmpty) ...[
                    SearchHeader(titleText: context.appLocalization.employees),
                    ...users.map((element) {
                      return AnchorTile(
                        name: element.displayName,
                        description: element.jobTitle,
                        onTap: () {
                          context.push((context) {
                            return UserScreen(user: element);
                          });
                        },
                      );
                    }),
                  ],
                  if (departments.isNotEmpty) ...[
                    SearchHeader(titleText: context.appLocalization.departments),
                    ...departments.map((element) {
                      return AnchorTile(
                        name: element.name,
                        onTap: () {
                          context.push((context) {
                            return DepartmentScreen(department: element);
                          });
                        },
                      );
                    }),
                  ],
                  if (tasks.isNotEmpty) ...[
                    SearchHeader(titleText: context.appLocalization.tasks),
                    ...tasks.map((element) {
                      return AnchorTile(
                        name: element.title,
                        description: element.description,
                        onTap: () {
                          context.push((context) {
                            return TaskDetailsScreen(task: element);
                          });
                        },
                      );
                    }),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
