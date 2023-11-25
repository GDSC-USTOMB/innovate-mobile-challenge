import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp/bloc/fetch_notes/fetch_notes_bloc.dart';
import 'package:noteapp/data/interfaces/notes_repository.dart';

import '../widgets/note_tile.dart';
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
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.only(top: 30),
          child: RefreshIndicator.adaptive(
            key: refreshIndicatorKey,
            onRefresh: () async {
              bloc.add(FetchNotes());
              await bloc.stream.firstWhere(
                (state) => state is! FetchNotesInProgress,
              );
            },
            child: BlocBuilder<FetchNotesBloc, FetchNotesState>(
              buildWhen: (previous, current) =>
                  current is! FetchNotesInProgress,
              builder: (context, state) {
                if (state is FetchNotesSuccess && state.notes.isNotEmpty) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.notes.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 25,
                    ),
                    itemBuilder: (context, index) {
                      const List<Color> colors = [
                        Color(0xFFFD99FF),
                        Color(0xFFFF9E9E),
                        Color(0xFF91F48F),
                        Color(0xFFFFF599),
                        Color(0xFF9EFFFF),
                        Color(0xFFB69CFF),
                      ];
                      return Dismissible(
                        key: ValueKey(state.notes[index]),
                        background: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.delete,
                            size: 48,
                          ),
                        ),
                        onDismissed: (_) {
                          GetIt.I
                              .get<NotesRepository>()
                              .deleteNote(state.notes[index])
                              .then((value) {
                            final message = value != null
                                ? value.message
                                : "Note was deleted successfully";
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message)),
                            );
                            refreshIndicatorKey.currentState?.show();
                          });
                        },
                        child: NoteTile(
                          state.notes[index],
                          cardColor: colors[index % colors.length],
                        ),
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/NewNote').then(
                  (value) => refreshIndicatorKey.currentState?.show(),
                );
          },
          child: SvgPicture.asset("assets/add.svg"),
        ),
      ),
    );
  }
}
