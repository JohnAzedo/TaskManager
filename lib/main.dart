import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todos/data/fake_repository.dart';
import 'package:todos/data/task_repository.dart';
import 'package:todos/domain/order_task_usecase.dart';
import 'package:todos/domain/task_usecase.dart';
import 'package:todos/ui/colors.dart';
import 'package:todos/ui/task_screen.dart';
import 'package:todos/ui/task_viewmodel.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: CustomColors.background,
          statusBarIconBrightness: Brightness.dark),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskViewModel(
            orderTaskUseCase: OrderTaskUseCase(
              repository: FakeRepository()
            ),
            useCase: TaskUseCaseImpl(
              repository: FakeRepository(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: "Todo App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: CustomColors.primary,
            backgroundColor: CustomColors.background,
            scaffoldBackgroundColor: CustomColors.background,
            secondaryHeaderColor: CustomColors.accent),
        home: TaskScreen(),
      ),
    );
  }
}
