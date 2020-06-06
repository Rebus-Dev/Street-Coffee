import 'package:bloc/bloc.dart';
import 'package:StreetCoffee/screens/Pages/MenuPage.dart';
import 'package:StreetCoffee/screens/Pages/MyCardsPage.dart';
import 'package:StreetCoffee/screens/Pages/CardBillsPage.dart';

enum NavigationEvents {
  DashboardClickedEvent,
  MessagesClickedEvent,
  UtilityClickedEvent
}

abstract class NavigationStates { }

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc({
    this.onMenuTap
  });

  @override
  NavigationStates get initialState => MyCardsPage(
    onMenuTap: onMenuTap,
  );

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DashboardClickedEvent:
        yield MyCardsPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.MessagesClickedEvent:
        yield MenuPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.UtilityClickedEvent:
        yield CardBillsPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}