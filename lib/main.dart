import 'package:counter_provider/color_model.dart';
import 'package:counter_provider/count_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CountModel>(
          create: (_) => CountModel(),
          ),
          ChangeNotifierProvider<ColorModel>(
          create: (_) => ColorModel(),
          ),
          ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    )
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // countの更新処理のみ
    final textChange = context.read<CountModel>();
    // CountModelのcountを監視
    final currentCount = context.select(((CountModel countModel) => countModel.count));
    //
    final textColor = context.watch<ColorModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Providerを学ぶ'),
          actions: <Widget>[
            Consumer<ColorModel>(
              builder: (context, model, child) {
                return IconButton(onPressed: (){
                  model.changeColor();
                }, icon: const Icon(Icons.cached));
              }
            )
          ],
        ),
        body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CountModel>(builder: (context, model, child){
                    return  Text(
                      '${model.count2}',
                        style: TextStyle(
                          fontSize: 50,
                          color: textColor.currentColor,)
                    );
                  }
                ),
                Consumer<CountModel>(builder: (context, model, child){
                    return Text(
                      '${currentCount}',
                      style: TextStyle(
                        fontSize: 50,
                        color: textColor.currentColor,)
                    );
                  }
                ),
              ],
            ),
          ),
        floatingActionButton: Consumer<CountModel>(builder: (context, model, child)
        {
            return FloatingActionButton(
              onPressed: textChange.incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }
        ),
    );
  }
}
