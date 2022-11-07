import 'package:cryptopedia/screen/components/crypto101_appbar.dart';
import 'package:flutter/material.dart';

class DetailCryptoSharing extends StatefulWidget {
  const DetailCryptoSharing({super.key});

  @override
  State<DetailCryptoSharing> createState() => _DetailCryptoSharingState();
}

class _DetailCryptoSharingState extends State<DetailCryptoSharing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //    appBar: Crypto101Appbar(
        //   size: 65,
        //   title: 'Crypto Sharing',
        //   articleId: id,
        //   isBookmarked: isBookmarked,
        //   bookmarkFunction: () async {
        //     setState(() {
        //       isLoading = true;
        //     });
        //     await Crypto101AddBookmarkApi.addBookmark(data.getUser()!.email!, id);
        //     setState(() {
        //       isBookmarked = !isBookmarked;
        //       isLoading = false;
        //     });
        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return PopUpDialog(
        //           type: 'success',
        //           title: 'Success!',
        //           description: isBookmarked
        //               ? 'This article added to bookmark!'
        //               : 'This article removed from bookmark!',
        //         );
        //       },
        //     );
        //     print(isBookmarked);
        //   },
        // ),
        );
  }
}
