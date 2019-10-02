import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Posts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 100)();

  TextColumn get body => text().withLength(min: 1, max: 250)();

  DateTimeColumn get createdDate =>
      dateTime().nullable().withDefault(Constant(DateTime.now()))();
}

@UseMoor(tables: [Posts], daos: [PostDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Posts])
class PostDao extends DatabaseAccessor<AppDatabase> with _$PostDaoMixin {
  final AppDatabase db;

  PostDao(this.db) : super(db);

  Future<List<Post>> getAllPosts() => select(posts).get();

  Stream<List<Post>> watchAllPosts() => select(posts).watch();

  Stream<List<Post>> watchPosts(String title) {
    return (select(posts)
          ..orderBy([
            (t) => OrderingTerm(
                expression: t.createdDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.title)
          ])
          ..where((t) => t.title.like(title)))
        .watch();
  }

  Future<int> insertPost(Insertable<Post> post) => into(posts).insert(post);

  Future updatePost(Insertable<Post> post) => update(posts).replace(post);

  Future deletePost(Insertable<Post> post) => delete(posts).delete(post);
}
