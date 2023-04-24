import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:fatima_admin/utils/Callback.dart';
import 'package:flutter/material.dart';

// class WAListFutureBuilder<T> extends StatelessWidget {
//   const WAListFutureBuilder({
//     Key? key,
//     required this.future,
//     required this.builder,
//     this.errorMessage,
//   }) : super(key: key);
//
//   final Future<T>? future;
//   final AsyncWidgetBuilder<T> builder;
//   final String? errorMessage;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: future,
//       builder: (context1, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator.adaptive());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text(snapshot.error.toString()));
//         } else {
//           if (snapshot.data is T) {
//             var data = snapshot.data as List;
//             if (data.isEmpty) {
//               return Center(
//                 child: Text(errorMessage ?? ''),
//               );
//             }
//           }
//           return builder(context1, snapshot);
//         }
//       },
//     );
//   }
// }

class WAListFutureBuilder<T> extends StatelessWidget {
  const WAListFutureBuilder({
    Key? key,
    required this.future,
    required this.itemBuilder,
    this.errorMessage,
  }) : super(key: key);

  final Future<T>? future;
  final ListItemBuilderCallback itemBuilder;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context1, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          if (snapshot.data is T) {
            var data = snapshot.data as List;
            if (data.isEmpty) {
              return Center(
                child: Text(errorMessage ?? ''),
              );
            }
          }
          var data = snapshot.data as List;
          return WAListView(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var item = data[index];
              return itemBuilder(context, index, item);
            },
          );
        }
      },
    );
  }
}
