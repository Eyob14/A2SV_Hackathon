import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  IssuesBloc() : super(IssuesInitial()) {
    on<IssuesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
