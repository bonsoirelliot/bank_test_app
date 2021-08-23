import 'package:flutter/material.dart';
import '../bloc/bank_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);
  PageController controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Ваши карты', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => BankBloc(),
        child: BlocBuilder<BankBloc, int>(
          builder: (context, state) {
            return Column(
              children: [
                Flexible(
                  flex: 2,
                  child: PageView.builder(
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
                              child: Center(child: Text('Карта $state')),
                            ),
                          ),
                        );
                      }),
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
                    'Платежи',
                    textAlign: TextAlign.start,
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: ListView.builder(
                      itemCount: cards[state].history.length,
                      itemBuilder: (context, int i) {
                        return ListTile(
                          leading: FlutterLogo(),
                          title: Text(cards[state].history[i].companyName),
                          subtitle: Text(cards[state].history[i].cathegory),
                          trailing: cards[state].history[i].isTreat
                              ? Text('-' +
                                  cards[state].history[i].price.toString())
                              : Text(cards[state].history[i].price.toString()),
                        );
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
