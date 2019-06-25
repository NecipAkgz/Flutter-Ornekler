import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:math' as math;

class SQLiteDemo extends StatefulWidget {
  @override
  _SQLiteDemoState createState() => _SQLiteDemoState();
}

class _SQLiteDemoState extends State<SQLiteDemo> {
  // test için data
  List<Client> testClients = [
    Client(firstName: "Neco", lastName: "Fişek", blocked: false),
    Client(firstName: "Zeki", lastName: "ZeroIQ", blocked: true),
    Client(firstName: "Hüseyin", lastName: "Colt", blocked: false),
    Client(firstName: "Herşey", lastName: "Güzel", blocked: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter SQLite")),
      // FutureBuilder ile listemize bağlandık
      body: FutureBuilder<List<Client>>(
        // future olarak database sınıfımızdaki bütün müşterileri getir
        // adlı methodunu verdik
        future: DBProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          // eğer verdiğimiz future içerisinde veri var ise bunları
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteClient(item.id);
                  },
                  child: ListTile(
                    title: Text(item.firstName),
                    subtitle: Text(item.lastName),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool value) {
                        DBProvider.db.blockOrUnblock(item);
                        setState(() {});
                      },
                      value: item.blocked,
                    ),
                  ),
                );
              },
            );
            // veri yok ise ekran ortasında dönen progressindicator göster
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // Floatingaction buton'a basınca listemizden rasgele müşteri oluşturacak
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Rasgele Müşteri",
        onPressed: () async {
          // listemizin uzunluğu sayısı kadar rasgele sayı üretip
          // o sayıya denk gelen müşteriyi database'e ekleyecek
          Client rnd = testClients[math.Random().nextInt(testClients.length)];
          await DBProvider.db.newClient(rnd);
          setState(() {});
        },
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                      DatabaseHelper sınıfımız ve CRUD                      */
/* -------------------------------------------------------------------------- */

/// Databasehelper.dart
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  // database nesnemizi çağırdığımızda bize gerekli işlemleri yapacak
  // yok ise oluştur var ise onu dön
  Future<Database> get database async {
    if (_database != null) return _database;

    // oluşmuş database yoksa oluştur onu dönder
    _database = await initDB();
    return _database;
  }

  initDB() async {
    // Klasör yolunu bul
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // Bulunan klasör yolu ve belirttiğimiz database ismi ile bir dosya yolu yarat
    String path = join(documentsDirectory.path, "TestDB.db");
    // Verdiğimiz dosya yolu, version bilgileri ışığında database'imizi yarat
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: _createDB,
    );
  }

  // Database oluşturulurkenki satır, sütun isimleri (Klasik SQL)
  Future _createDB(Database db, int version) async {
    await db.execute("CREATE TABLE Client ("
        "id INTEGER PRIMARY KEY,"
        "first_name TEXT,"
        "last_name TEXT,"
        "blocked BIT"
        ")");
  }

  /// Yeni Kayıt
  newClient(Client newClient) async {
    final db = await database;
    // Client isimli tabloya parametre olarak verdiğimiz yeni müşteriyi
    // map'e çevir ve database'imize ekle
    var sonuc = await db.insert("Client", newClient.toMap());
    // geri dönüş değerini dönder, ekleme olumlu olursa, eklendi "id"'yi dönecek
    return sonuc;
  }

  /// Verilen "id" değerine göre elemanı getir
  getClient(int id) async {
    final db = await database;
    // parametre olarak verdiğimiz "id" ye göre database'den ilgili elemanı getircek
    var sonuc = await db.query("Client", where: "id = ?", whereArgs: [id]);
    // eğer sonuc boş değilse bulduğu ilk elemanı dön, boş işe null dön
    return sonuc.isNotEmpty ? Client.fromMap(sonuc.first) : Null;
  }

  /// bütün elemanları getir
  Future<List<Client>> getAllClients() async {
    final db = await database;
    var sonuc = await db.query("Client");
    List<Client> list =
        sonuc.isNotEmpty ? sonuc.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  /// sadece bloklanmış elemanları liste şeklinde dönecek
  Future<List<Client>> getBlockedClients() async {
    final db = await database;
    var sonuc = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);
    List<Client> list =
        sonuc.isNotEmpty ? sonuc.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  /// var olan müşteriyi günceller
  updateClient(Client newClient) async {
    final db = await database;
    var sonuc = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return sonuc;
  }

  /// Verilen müşteriyi bloklar veya açar
  blockOrUnblock(Client client) async {
    final db = await database;
    Client blocked = Client(
        id: client.id,
        firstName: client.firstName,
        lastName: client.lastName,
        blocked: !client.blocked);
    var sonuc = await db.update("Client", blocked.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return sonuc;
  }

  /// verilen id değerine göre müşteriyi siler
  deleteClient(int id) async {
    final db = await database;
    db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  /// bütün müşterileri siler
  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }
}

/* -------------------------------------------------------------------------- */
/*                            ClientModel Sınıfımız                           */
/* -------------------------------------------------------------------------- */

/// ClientModel.dart
Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String firstName;
  String lastName;
  bool blocked;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.blocked,
  });

  // gelen map verisini json'a dönüştürür
  factory Client.fromMap(Map<String, dynamic> json) => new Client(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        blocked: json["blocked"] == 1,
      );

  // gelen json' verisini Map'e dönüştürür
  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "blocked": blocked,
      };
}
