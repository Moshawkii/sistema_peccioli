import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistema_peccioli_2/blocs/app_blocs.dart';
import 'package:sistema_peccioli_2/blocs/app_events.dart';
import 'package:sistema_peccioli_2/blocs/app_state.dart';
import 'package:sistema_peccioli_2/repository/repositories.dart';
import 'package:sistema_peccioli_2/responses/home_response.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        context.read<Repository>(),
      )..add(LoadHomeEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red.shade300,
                ),
              );
            case HomeErrorState:
              return Center(
                child: Text('Si è verificato un errore!'),
              );
            case HomeLoadedState:
              return _buildPage(
                context: context,
                response: (state as HomeLoadedState).response!,
              );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildPage({
    required BuildContext context,
    required HomeResponse response,
  }) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Center(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ULTIME NEWS",
                      style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      color: Colors.grey.shade200,
                      width: 120,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(),
                            ),
                          );
                        },
                        child: Text(
                          "Vedi Tutte >",
                          style: TextStyle(
                            backgroundColor: Colors.red.shade300,
                            fontFamily: "Rubik",
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Material(
                    color: Colors.white,
                    child: Container(
                      height: 150,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            response.news?[index].photo ?? '',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    response.news?[index].title ?? '',
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      color: Colors.black,
                                      fontFamily: "Rubik",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 21),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      response.news?[index].date ?? '',
                                      style: TextStyle(
                                        letterSpacing: 3,
                                        color: Colors.blueGrey.shade300,
                                        fontFamily: "Rubik",
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      splashRadius: 24.0,
                                      visualDensity: VisualDensity.compact,
                                      icon: Icon(
                                        Icons.share_outlined,
                                        color: Colors.blueGrey.shade300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 16.0,
                  ),
                  itemCount: 3,
                ),
                SizedBox(
                  height: 32.0,
                ),
                Text(
                  "EVENTI E SPETTACOLI",
                  style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.0,
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 8.0,
                      crossAxisCount: 2,
                    ),
                    itemCount: (response.shows?.length ?? 0) > 2
                        ? 2
                        : response.shows?.length ?? 0,
                    itemBuilder: (context, index) => Material(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AspectRatio(
                            aspectRatio: 1.2,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  bottom: 20,
                                  child: Image.network(
                                    response.shows?[index].photo ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  left: 8.0,
                                  bottom: 0,
                                  child: Container(
                                    color: Colors.red.shade300,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                        horizontal: 4.0,
                                      ),
                                      child: Text(
                                        '${response.shows?[index].calendarTitle[0] ?? ''}\n${response.shows?[index].calendarTitle[1] ?? ''}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              response.shows?[index].title ?? '',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 470,
                        decoration:
                            BoxDecoration(color: Colors.blueGrey.shade900),
                        child: Image.asset(
                          "assets/fonts/image/cards_home.webp",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "VIAGGI NELL'ARTE",
                                style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontFamily: "Rubik",
                                    fontSize: 24,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(height: 7),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                color: Colors.black38,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Acquista la tua Card >",
                                    style: TextStyle(
                                        color: Colors.red.shade300,
                                        fontFamily: "Rubik",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    color: Colors.red.shade300,
                    height: 120,
                    width: 470,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Text(
                            "HAI QUALCOSA DA SEGNALARCI?",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Rubik",
                                fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Container(
                            color: Colors.white,
                            height: 50,
                            width: 250,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "SCRIVI LA TUA SEGNALAZIONE >",
                                style: TextStyle(
                                    color: Colors.red.shade300,
                                    fontFamily: "Rubik",
                                    fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "GALLERIA FOTOGRAFICA",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Rubik",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Container(
                      height: 130,
                      color: Colors.blueGrey.shade900,
                      child: ListView.separated(
                        padding: EdgeInsets.all(8.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: response.gallery?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 130,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.network(
                                    response.gallery?[index].photo ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    color: Colors.black26,
                                    child: Text(
                                      response.gallery?[index].name ?? '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
