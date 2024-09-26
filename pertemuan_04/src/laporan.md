# Pemrograman Mobile - Pertemuan 4

Nama : Filla Ramadhani Utomo

NIM : 2241720209

Kelas : TI-3F

<br>

## Praktikum 1

#### Langkah 2

##### Kode Program

```dart
void main() {
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
}
```

![praktikum 1](/docs/P1%20L2.png)

Penjelasan:

- Kode melakukan operasi assert bahwa panjang list adalah 3 dan elemen pada index 1 adalah 2,
- kemudian melakukan pencetakan panjang list yang menghasilkan output 3.
- Lalu melakukan pencetakan elemen pada indeks 1 yang menghasilkan output 2.
- Setelah itu kode mengubah nilai elemen indeks 1 menjadi 1.
- Kode melakukan operasi assert bahwa elemen pada indeks 1 adalah 1
- Lalu melakukan pencetakan elemen pada indeks ke 1 yang menghasilkan output 1

#### Langkah 3

##### Kode Program
``` dart
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
```
![praktikum 1](/docs/P1%20L3.png)
Penjelasan: Terjadi error karena pada line 3 dilakukan assert bahwa panjang list adalah 3 yang seharusnya panjang list adalah 5. Terjadi juga pada seluruh kode yang menjalankan assert karena tidak ada yang sesuai

<br>

## Praktikum 2

#### Langkah 2

##### Kode Program

``` dart
void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
}
```

![praktikum 2](/docs/P2%20L2.png)

Penjelasan : Kode tersebut mendeklarasikan set 'halogens' dengan 5 elemen. Kemudian melakukan pencetakan pada semua isi set 'halogens'

#### Langkah 3

##### Kode Program

``` dart
void main() {
  var names1 = <String>{};
  names1.add('Filla');
  names1.add('2241720209');
  Set<String> names2 = {}; 
  names2.addAll({'Filla','2241720209'});
  
  print(names1);
  print(names2);
}
```
![praktikum 2](/docs/P2%20L3.png)

Penjelasan: Kode melakukan pendeklarasian set 'names1' dan 'names2' dengan cara yang berbeda.

<br>

## Praktikum 3

#### Langkah 2

##### Kode Program
``` dart
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
}
```

![praktikum 3](/docs/P3%20L2.png)

Penjelasan : Output tetap sama karena variabel 'mhs1' dan 'mhs2' hanya dideklarasikan tanpa digunakan

#### Langkah 3

##### Kode Program

``` dart
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
```
![praktikum 3](/docs/P3%20L3.png)

<br>

### Praktikum 4

#### Langkah 2

##### Kode Program

``` dart
void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);
}
```

Penjelasan : Terjadi error karena 'list1' tidak pernah di deklarasi. Maka ubah 'list1' menjadi 'list'

![praktikum 4](/docs/P4%20L2.png)

#### Langkah 3

##### Kode Program

``` dart
void main() {
   var list1 = [1, 2, null];
   print(list1);
   var list3 = [2241720209 , ...list1];
   print(list3);
}
```
Penjelasan : Terjadi error karena saat pendeklarasian 'list1' tidak diberi tipe data dan pada 'list3' ada tanda '?' yang tidak perlu pada spread operator

![praktikum 4](/docs/P4%20L3.png)

#### Langkah 4

##### Kode Program

Penjelasan : Terjadi error karena variabel 'promoActive' belum dideklarasikan

kondisi false

``` dart
  var nav = ['Home', 'Furniture', 'Plants', if (false) 'Outlet'];
  print(nav);
```

![praktikum 4](/docs/P4%20L4F.png)

kondisi true

``` dart
  var nav = ['Home', 'Furniture', 'Plants', if (true) 'Outlet'];
  print(nav);
```

![praktikum 4](/docs/P4%20L4T.png)

#### Langkah 5

##### Kode Program

``` dart
var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
print(nav2);
```

penjelasan : terjadi error karena variabel 'login' belum dideklarasikan

kondisi manager

```dart
var login = 'Manager';
var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
print(nav2);
```

![praktikum 4](/docs/P4%20L5M.png)

kondisi direktur

```dart
var login = 'direktur';
var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
print(nav2);
```

![praktikum 4](/docs/P4%20L5D.png)

#### Langkah 6

##### Kode Program

```dart
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
print(listOfStrings);
```

Penjelasan : Collection For digunakan untuk membuat data pada list yang memiliki pola berulang

![praktikum 4](/docs/P4%20L6.png)

<br>

### Praktikum 5

#### Langkah 2

##### Kode Program

``` dart
void main() {
   var record = ('first', a: 2, b: true, 'last');
   print(record);
}
```

Penjelasan : Terjadi error karena kurang ';'

![praktikum 5](/docs/P5%20L2.png)

#### Langkah 3

##### Kode Program

``` dart
 (int, int) tukar((int, int) record) {
     var (a, b) = record;
     return (b, a);
   }
```

Penjelasan : Tidak terjadi perubahan pada output

![praktikum 5](/docs/P5%20L3.png)

#### Langkah 4

##### Kode Program

``` dart
   (String, int) mahasiswa = ('Filla Ramadhani Utomo', 2241720209);
   print(mahasiswa);
```

Penjelasan : Terjadi error karena variabel 'mahasiswa' memiliki nilai null

![praktikum 5](/docs/P5%20L4.png)

#### Langkah 5

##### Kode Program

``` dart
  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
```

Penjelasan : Tidak terjadi error (Berhasil)

![praktikum 5](/docs/P5%20L5.png)

<br>

### Tugas Praktikum

2. Function merupakan objek yang memiliki tipe dan melakukan tugas tertentu. Function juga dapat memiliki parameter yang diperlukan, opsional, bernama, dan posisional
   <br>

3. Beberapa jenis parameter:

- Required Parameters, yaitu parameter yang harus diberikan ketika memanggil fungsi
  ```
  void identitas(String nama) {
  print('$nama!');
  }
  ```
- Optional Parameters, yaitu parameter tidak wajib diberikan ketika memanggil fungsi. Ada 2 jenis optional parameter yaitu:
  - Named Parameters, menggunakan {} untuk deklarasi
    ```
    void printData({String nama, int nomorBuku}) {
      print('Nama: $nama, Nomor Buku: $nomorBuku');
    }
    ```
  - Positional Parameters, menggunakan [] untuk deklarasi
    ```
    void showInfo(String name, [int age = 30]) {
      print('Name: $name, Age: $age');
    }
    ```

4. Berarti bahwa kita dapat memperlakukan fungsi sebagai nilai dari jenis lain

   ```
   void data(String nama) {
     print('Nama:  $nama!');
   }

   void main() {
     var info = data;
     info('Filla');
   }
   ```

5. Merupakan fungsi yang tidak memiliki nama. Fungsi ini digunakan untuk membuat blok kode yang dapat dipanggil tanpa harus memberikan nama terlebih dahulu

   ```
   var add = (int a, int b) => a + b;
   ```

6. Perbedaan Lexical scope dan Lexical closures

- Lexical scope, adalah variabel yang dideklarasikan dalam suatu blok kode hanya dapat diakses di dalam blok kode tersebut atau di dalam blok kode anak yang bersarang di dalamnya

  ```
  void main() {
    var x = 10;

    void printX() {
        print(x); // Variabel x diambil dari lexical scope
    }

    printX();
  }
  ```

- Lexical closures, adalah fungsi yang dapat mengakses variabel di dalam Lexical scope-nya, bahkan ketika fungsi tersebut digunakan di luar Lexical scope aslinya

  ```
  Function makeCounter() {
    var count = 0;
    return () {
        return ++count;
    };
    }

    void main() {
    var counter = makeCounter();

    print(counter()); // 1
    print(counter()); // 2
  }
  ```

7. ```
   import 'package:tuple/tuple.dart';

   Tuple2<int, String> foo() {
     return Tuple2(42, "foobar");
   }

   void main() {
     var result = foo();
     print(result.item1); // 42
     print(result.item2); // foobar
   }
   ```












