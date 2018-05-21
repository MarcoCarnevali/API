import Vapor
import FluentMySQL
/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    try services.register(FluentMySQLProvider())
    
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    var databases = DatabasesConfig()
    databases.add(database: MySQLDatabase(config: MySQLDatabaseConfig(hostname: "localhost", port: 3306 , username: "root", password: "velando123", database: "Users")), as: .mysql)
    
    services.register(databases)
    
    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Users.self, database: .mysql)
    services.register(migrations)
    
    
}

extension Users: Migration { }


