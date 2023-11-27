import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:noteapp/bloc/fetch_notes/fetch_notes_bloc.dart';
import 'package:noteapp/data/interfaces/notes_repository.dart';

import '../../models/failure.dart';
import '../../models/note.dart';
import '../widgets/enter_your_first_note.dart';
import '../widgets/no_results.dart';
import '../widgets/note_tile.dart';
import '../widgets/notes_list_view.dart';
import '../widgets/square_icon_button.dart';
import 'about_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
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
            SearchAnchor(
              builder: (context, controller) => SquareIconButton(
                onPressed: () => controller.openView(),
                icon: const Icon(Icons.search),
              ),
              viewHintText: "Search by the keyword...",
              suggestionsBuilder: (context, controller) async {
                final notes = await GetIt.I
                    .get<NotesRepository>()
                    .searchNotes(controller.text);
                if (notes is Success<List<Note>, Failure> &&
                    notes.success.isNotEmpty) {
                  return notes.success
                      .map(
                        (note) => Padding(
                          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                          child: NoteTile(
                            note,
                            cardColor: const Color(0xFFFD99FF),
                          ),
                        ),
                      )
                      .toList();
                }
                return noResults;
              },
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
                if (state is FetchNotesSuccess && state.notes.isEmpty) {
                  return const SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: EnterYourFirstNote(),
                  );
                } else if (state is FetchNotesSuccess) {
                  return NotesListView(
                    refreshIndicatorKey: refreshIndicatorKey,
                    notes: state.notes,
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
