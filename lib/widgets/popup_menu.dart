import 'package:flutter/material.dart';

import '../models/task.dart';

class PopupMenus extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallback;
  final Task task;
  const PopupMenus(
      {Key? key,
      required this.cancelOrDeleteCallback,
      required this.likeOrDislike,
      required this.editTaskCallback,
      required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                    onTap: editTaskCallback,
                  ),
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text('Add to Bookmark')
                            : const Text('Remove from Bookmark')),
                    onTap: likeOrDislike,
                  ),
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete')),
                    onTap: cancelOrDeleteCallback,
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.restore_from_trash),
                        label: const Text('Restore')),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Forever')),
                    onTap: cancelOrDeleteCallback,
                  ),
                ]);
  }
}
