import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sallah_app/Controllers/App/get_questions_controller.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';

import '../../../constants/colors.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/expansion_tile.dart';

class FQAScreen extends StatelessWidget {
  const FQAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'FQA'),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: FutureBuilder(
              future: AllQuestionsController.getQuestions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kMainColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('there is an error : ${snapshot.error}'),
                  );
                } else {
                  final fQAModel = snapshot.data!;
                  if (fQAModel.questions == null ||
                      fQAModel.questions!.isEmpty) {
                    return const Center(
                      child: Text('No offers found.'),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: fQAModel.questions?.length ?? 0,
                      itemBuilder: (context, index) {
                        final question = fQAModel.questions![index];
                        return ExpansionTileWidget(
                          answer: question.answer!,
                          question: question.question!,
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
