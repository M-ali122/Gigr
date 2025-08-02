abstract class NavState {
  final int selectedIndex;
  const NavState(this.selectedIndex);
}

class NavInitial extends NavState {
  const NavInitial() : super(0);
}

class NavChanged extends NavState {
  const NavChanged(int index) : super(index);
}
