import Foundation
import Vapor

struct RoutesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: index)
        routes.get("index.html", use: index)
    }
    
    func index(request: Request) async throws -> View {
            return try await request.view.render("/Users/roberto/Vapor-Projects/vapor/Epix/Resources/Views/index.html")
    }
}
