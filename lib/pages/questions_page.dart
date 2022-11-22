import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodquestions/data/questions_data.dart';
import 'package:foodquestions/models/result_model.dart';
import 'package:foodquestions/pages/init_page.dart';
import 'package:foodquestions/pages/result_page.dart';
import 'package:foodquestions/pages/widgets/button_answer.dart';
import 'package:foodquestions/pages/widgets/image_item.dart';
import 'package:foodquestions/provider/questions_provider.dart';
import 'package:foodquestions/provider/result_provider.dart';

class QuestionsPage extends ConsumerStatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends ConsumerState<QuestionsPage> {
  Map<int, int> save = {};

  final PageController _pageController = PageController();
  bool result = false;
  List<String> options = [];
  final player = AudioPlayer();
  Duration duration = Duration.zero;

  @override
  void initState() {
    options = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
    // TODO: implement initState
    Future.microtask(() => ref.read(questionsProvider.notifier).randomData());
    // Future.delayed(Duration(seconds: 1), () {
    //   return Navigator.of(context).push(MaterialPageRoute(builder: (context) => InitPage(),));
    // },);
    player.play(AssetSource(
      'mymusic.mp3',
    ));
    player.setVolume(0.09);

    player.onPositionChanged.listen((event) {
      if (event.inSeconds == 165) {
        player.seek(const Duration(seconds: 0));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? select = ref.watch(questionsProvider).select;
    final data = ref.watch(questionsProvider).questions;
    final media = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xff006693),
        body: SafeArea(
          child: SizedBox(
            height: media.size.height,
            width: media.size.width,
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                controller: _pageController,
                reverse: false,
                itemBuilder: (context, index) {
                  final question = data[index];
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(60),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${index + 1}/${data.length}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ImageItem(
                            index: index,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            runSpacing: 12,
                            children: List.generate(question.tags.length,
                                (answerIndex) {
                              return ButtonAnswer(
                                borderColor: select == answerIndex
                                    ? const Color(0xffa665e6)
                                    : Colors.white,
                                buttonColor: select == answerIndex
                                    ? const Color(0xffa665e6)
                                    : Colors.transparent,
                                onTap: () {
                                  ref
                                      .read(questionsProvider.notifier)
                                      .selectState(answerIndex);
                                  ref.read(resultProvider.notifier).addResult(
                                      ResultModel(
                                          answer: question.tags[answerIndex],
                                          questionModel: question));
                                },
                                answer: question.tags[answerIndex].description,
                                answerSelect: '${options[answerIndex]}.',
                              );
                            }),
                          ),
                          // const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                  onPressed: () async {
                                    validations(index: index, select: select);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        (index + 1) == data.length
                                            ? "Terminar "
                                            : "Siguiente",
                                        style: const TextStyle(
                                            color: Color(0xffba04e3),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      const Icon(Icons.arrow_forward_ios,
                                          color: Color(0xffba04e3)),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  validations({required int index, required int? select}) {
    if (select == null) {
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Seleccione una respuesta")));
    } else {
      if (index < ref.read(questionsProvider).questions.length) {
        _pageController.jumpToPage(index + 1);
      }
      ref.read(questionsProvider.notifier).selectState(null);
      if (index == ref.read(questionsProvider).questions.length - 1) {
        player.pause();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(),
        ));
      }
    }
  }
}

//'¡MUY BIEN! 😁 Respuesta correcta: ${questionCompare.answerCorrect}'
//'Respuesta incorrecta 😭. La respuesta correcta es: ${questionCompare.answerCorrect}'
