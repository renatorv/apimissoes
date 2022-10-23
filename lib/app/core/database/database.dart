import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> openConnection() async {
    return MySqlConnection.connect(
      ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'missoes',
        db: 'bdmissoes',
        //
        // host: env['DATABASE_HOST'] ?? '',
        // port: int.tryParse(env['DATABASE_PORT'] ?? '') ?? 3306,
        // user: env['DATABASE_USER'] ?? '',
        // password: env['DATABASE_PASSWORD'] ?? '',
        // db: env['DATABASE_NAME'] ?? '',
      ),
    );
  }
}
