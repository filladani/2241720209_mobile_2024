void main() {
   var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium', 
    10: 'neon', 
    18: 2
    };

  print(gifts);
  print(nobleGases);


    var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Filla Ramadhani Utomo';
  mhs1['nim'] = '2241720209';

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['sixth'] = 'Filla Ramadhani Utomo';
  gifts['seventh'] = '2241720209';

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Filla Ramadhani Utomo';
  mhs2[2] = '2241720209';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  nobleGases[25] = 'Filla Ramadhani Utomo';
  nobleGases[30] = '2241720209';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}