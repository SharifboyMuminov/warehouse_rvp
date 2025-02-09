import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:warehouse_rvp/data/models/network_response.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';

class SqfliteSource {
  static final databaseInstance = SqfliteSource._();

  SqfliteSource._();

  factory SqfliteSource() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }



  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER NOT NULL";

    await db.execute('''CREATE TABLE Products (
  id $idType,
  count $intType,
  price REAL,
  product_name $textType,
  qr $textType,
  description $textType,
  image_path TEXT NOT NULL CHECK(LENGTH(image_path) <= 500)
)''');

  }

  Future<NetworkResponse> insertProduct(ProductModel productModel) async {
    NetworkResponse myResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;

      int savedTaskID = await db.insert("Products", productModel.toJson());

      myResponse.data = productModel.copyWith(id: savedTaskID);
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<NetworkResponse> updateProduct(ProductModel productModel) async {
    NetworkResponse myResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;

      myResponse.data = await db.update(
          "Products", productModel.toJsonForUpdate(),
          where: "id = ?", whereArgs: [productModel.id]);
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<NetworkResponse> getAllProduct() async {
    NetworkResponse myResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;
      String orderBy = "id DESC";
      List json = await db.query("Products", orderBy: orderBy);
      myResponse.data = json.map((e) => ProductModel.fromJson(e)).toList();
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<NetworkResponse> deleteProduct(ProductModel productModel) async {
    NetworkResponse myResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;

      // Execute the delete query using the ID from the model
      myResponse.data = await db.delete(
        "Products",
        where: "id = ?",
        whereArgs: [productModel.id],
      );
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }

  Future<NetworkResponse> searchNotes(String query) async {
    NetworkResponse myResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;

      var json = await db.query(
        "Products",
        where: "(qr LIKE ? OR product_name LIKE ?)",
        whereArgs: ["$query%", "$query%"],
      );

      myResponse.data = json.map((e) => ProductModel.fromJson(e)).toList();
    } catch (error) {
      myResponse.errorText = error.toString();
    }

    return myResponse;
  }
}
