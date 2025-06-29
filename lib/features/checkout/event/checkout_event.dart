abstract class CheckoutEvent {
  Object? arguments;

  CheckoutEvent(this.arguments);
}

class Update extends CheckoutEvent {
  Update({Object? arguments}) : super(arguments);
}

class Initial extends CheckoutEvent {
  Initial({Object? arguments}) : super(arguments);
}

class Create extends CheckoutEvent {
  Create({Object? arguments}) : super(arguments);
}

class Display extends CheckoutEvent {
  Display({Object? arguments}) : super(arguments);
}

class Click extends CheckoutEvent {
  Click({Object? arguments}) : super(arguments);
}
