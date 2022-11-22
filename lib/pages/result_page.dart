import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodquestions/pages/init_page.dart';
import 'package:foodquestions/provider/result_provider.dart';
import 'package:intl/intl.dart';

class ResultPage extends ConsumerStatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat(".##", "en_US");
    final results = ref.watch(resultProvider).results;
    final correctAnswers =
        results.where((element) => element.answer.correct).length;
    final validations = ref.watch(resultProvider.notifier).validations();

    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: const Color(0xffba04e3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: const Text(
                  '¿Estas seguro?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                content: const Text(
                  'De querer regrasar al inicio',
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    //<-- SEE HERE
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Color(0xff006693),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }, // <-- SEE HERE
                    child: const Text(
                      'Si',
                      style: TextStyle(
                          color: Color(0xff006693),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )) ??
            false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff006693),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "Resultado de la prueba",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (results.isNotEmpty)
                Text(
                  'Nota: ${format.format(resultValue())}%',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              Text(
                resultValue() > 59
                    ? 'Has ganado la prueba.'
                    : 'Has perdido la prueba. Sigue intentando para un mejor resultado.',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Correctas $correctAnswers/${results.length}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 7,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: validations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffba04e3).withAlpha(40),
                        ),
                        child: ListTile(
                          title: Text(
                            '${index + 1}. ${validations[index]} ${results[index].answer.correct ? results[index].answer.description : results[index].answer.description}',
                            style: TextStyle(
                                color: results[index].answer.correct
                                    ? Colors.green
                                    : Colors.white,
                                fontWeight: results[index].answer.correct
                                    ? FontWeight.bold
                                    : null),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 49,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: const Color(0xffba04e3)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const InitPage(),
                    ));
                    ref.read(resultProvider.notifier).cleanList();
                  },
                  child: const Text(
                    "Regresar a inicio",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              )
            ],
          ),
        )),
      ),
    );
  }

  resultValue() {
    final results = ref.watch(resultProvider).results;
    final corrects = results.where((element) => element.answer.correct);

    final double total = ((corrects.length + 1) / (results.length + 1)) * 100;
    return total;
  }
}
