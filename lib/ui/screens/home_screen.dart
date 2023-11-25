import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp/bloc/fetch_notes/fetch_notes_bloc.dart';

import '../widgets/square_icon_button.dart';
import 'about_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FetchNotesBloc bloc;
  late final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I.get<FetchNotesBloc>();
    refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      refreshIndicatorKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          actions: [
            SquareIconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            const SizedBox(width: 21),
            SquareIconButton(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) => const AboutNotesAppDialog(),
                );
              },
              icon: const Icon(Icons.info_outline),
            ),
            const SizedBox(width: 24),
          ],
        ),
        body: RefreshIndicator.adaptive(
          key: refreshIndicatorKey,
          onRefresh: () async {
            bloc.add(FetchNotes());
            bloc.stream.firstWhere(
              (state) => state is! FetchNotesInProgress,
            );
          },
          child: BlocBuilder<FetchNotesBloc, FetchNotesState>(
            builder: (context, state) {
              if (state is FetchNotesSuccess && state.notes.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) {
                    final note = state.notes[index];
                    return ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                    );
                  },
                );
              } else if (state is FetchNotesSuccess) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 180),
                        Image.asset("assets/rafiki.png"),
                        const SizedBox(height: 6),
                        const Text('Enter your first note'),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/NewNote');
          },
          child: SvgPicture.asset("assets/add.svg"),
        ),
      ),
    );
  }
}
