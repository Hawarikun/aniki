import 'package:aniki/core/domain/seasons.dart';
import 'package:aniki/features/seasons/data/archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArchiveSeasonsController
    extends StateNotifier<AsyncValue<List<Seasons>>> {
  ArchiveSeasonsController(this.repo) : super(const AsyncValue.loading()) {
    getAllSeasons();
  }

  final ArchiveRepository repo;

  Future getAllSeasons() async {
    state = const AsyncValue.loading();
    try {
      final response = await repo.index();
      state = AsyncValue.data(response);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final archiveSeasonsControllerProv =
    StateNotifierProvider<ArchiveSeasonsController, AsyncValue<List<Seasons>>>(
  (ref) {
    final repo = ref.read(archiveRepoProv);
    return ArchiveSeasonsController(repo);
  },
);
