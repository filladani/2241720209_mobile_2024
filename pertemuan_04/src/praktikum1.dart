void main() {
  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);


  final list = List<Object?>.filled(5,null);
  assert(list.length == 5);
  assert(list[1] == null);
  print(list.length);
  print(list[1]);

  list[1] = 'Filla';
  list[2] = 2241720209;
  assert(list[1] == 'Filla');
  print(list[1]);
  print(list[2]);
  print(list);
}