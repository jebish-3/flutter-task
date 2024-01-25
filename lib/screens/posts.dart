import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task/constants/api_constants.dart';
import 'package:task/services/post_services.dart';
import 'package:task/widgets/post_list_tile.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final String apiUrl = API.apiUrl;
  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);
  late List<dynamic> postList = [];
  late PostService _postService;

  @override
  void initState() {
    super.initState();
    _postService = PostService(apiUrl: apiUrl);
    _pagingController.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
  }

  Future<void> fetchData(int pageKey) async {
    try {
      final newItems = await _postService.fetchPosts(pageKey);

      final isLastPage = newItems.isEmpty;
      if (isLastPage) {
        _pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        postList.addAll(newItems);
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: PagedListView<int, dynamic>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            return PostListTile(item: item);
          },
          firstPageErrorIndicatorBuilder: (context) => const Center(
            child: Text('Error loading data'),
          ),
          newPageErrorIndicatorBuilder: (context) => const Center(
            child: Text('Error loading more data'),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text('No items found'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
