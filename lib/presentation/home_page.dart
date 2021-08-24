import 'dart:ui';

import 'package:flutter/material.dart';
import '../bloc/bank_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository.dart';
import '../bloc/blur_bloc.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);
  PageController controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BankBloc()),
        BlocProvider(create: (context) => BlurBloc()),
      ],
      child: Scaffold(
        appBar: new AppBar(
          title:
              const Text('Ваши карты', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        floatingActionButton: BlocBuilder<BlurBloc, bool>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<BlurBloc>().add(BlurEvent.update);
              },
              child: Icon(Icons.add),
            );
          },
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: BlocBuilder<BankBloc, int>(
                builder: (context, state) {
                  return PageView.builder(
                      controller: controller,
                      onPageChanged: (int page) {
                        if (page > state) {
                          context.read<BankBloc>().add(BankEvent.increment);
                        } else {
                          context.read<BankBloc>().add(BankEvent.decrement);
                        }
                        print(page.toString());
                      },
                      itemCount: cards.length,
                      itemBuilder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Карта ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  BlocBuilder<BlurBloc, bool>(
                                    builder: (context, blurstate) {
                                      return ImageFiltered(
                                        imageFilter: ImageFilter.blur(
                                            sigmaX: blurstate ? 5.0 : 0.0,
                                            sigmaY: blurstate ? 5.0 : 0.0),
                                        child: Text(
                                          'Баланс: ' +
                                              cards[state].balance.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Квитанция'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Автоплатеж'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Автоплатеж'),
                    ),
                  ],
                )),
            Flexible(
              flex: 1,
              child: Text(
                'Операции',
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: 4,
              child: BlocBuilder<BankBloc, int>(
                builder: (context, state) {
                  return ListView.builder(
                      itemCount: cards[state].history.length,
                      itemBuilder: (context, int i) {
                        return ListTile(
                          leading: FlutterLogo(),
                          title: Text(cards[state].history[i].companyName),
                          subtitle: Text(cards[state].history[i].cathegory),
                          trailing: BlocBuilder<BlurBloc, bool>(
                            builder: (context, blurstate) {
                              return ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: blurstate ? 5.0 : 0.0,
                                  sigmaY: blurstate ? 5.0 : 0.0,
                                ),
                                child: cards[state].history[i].isTreat
                                    ? Text('-' +
                                        cards[state]
                                            .history[i]
                                            .price
                                            .toString())
                                    : Text(cards[state]
                                        .history[i]
                                        .price
                                        .toString()),
                              );
                            },
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
