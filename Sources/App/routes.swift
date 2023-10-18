import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: RoutesController())
    
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get(".well-known", "apple-app-site-association") { req -> EventLoopFuture<Response> in
            print(app.directory.publicDirectory)
            let filePath = "/Users/roberto/Vapor-Projects/vapor/Epix/Public/" + "apple-app-site-association"
            
            // Check if the file exists
            if FileManager.default.fileExists(atPath: filePath) {
                // Read the contents of the file
                if let data = FileManager.default.contents(atPath: filePath) {
                    // Create a Vapor Response with the file's data and set the appropriate content type
                    let response = Response(status: .ok)
                    response.headers.add(name: "Content-Type", value: "application/json")
                    response.body = .init(data: data)
                    return req.eventLoop.makeSucceededFuture(response)
                }
            }
            
            return req.eventLoop.makeFailedFuture(Abort(.notFound))
        }
}
