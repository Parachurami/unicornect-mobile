import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicornect/app/models/event.dart';

class BookmarkProviderNotifier extends StateNotifier<List<Event>>{
  BookmarkProviderNotifier():super([]);
  void addToBookmark(Event event){
    state = [...state, event];
    print(state.last.title);
  }

  void removeFromBookMark(Event event){
    state = state.where((e) => e.id != event.id).toList();
  }

  bool isBookmarked(Event event){
    return state.contains(event);
  }
}

final bookmarkProvider = StateNotifierProvider<BookmarkProviderNotifier, List<Event>>(
    (ref){
      return BookmarkProviderNotifier();
    }
);