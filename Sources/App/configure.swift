import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: "/Users/roberto/Vapor-Projects/vapor/Epix/Public/"))
    print(app.directory.publicDirectory)

    // register routes
    try routes(app)
}
