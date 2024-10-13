enum RoutesEnum {
  login(name: 'login', path: '/'),
  bonus(name: 'bonus', path: '/bonus'),
  summary(name: 'summary', path: '/summary'),
  selfExecution(name: 'self-execution', path: '/self-execution');

  const RoutesEnum({required this.name, required this.path});
  final String name;
  final String path;
}
