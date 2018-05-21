import Vapor
import Fluent
import FluentMySQL

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    struct User: Content {
        var name: String
        var email: String
    }
    
    router.get("user") { req -> User in
        return User(
            name: "Vapor User",
            email: "user@vapor.codes"
        )
    }
    
    router.get("users") { req in
        return Users.query(on: req).all()
    }
    
    struct UsersInfo:Content {
        let email: String
    }
    
    router.post("login") { req -> Future<Response> in
       return try req.content.decode(Users.self).flatMap { loginRequest in
            var response = Response(http: HTTPResponse(status: .ok), using: req)
            
            return try Users.query(on: req).filter(\.email == loginRequest.email).first().map{ user -> Response in
                // Do if statement here
                if let email = user?.email {
                    response = Response(http: HTTPResponse(status: .notAcceptable), using: req)
                    try response.content.encode(UsersInfo(email: email))
                    return response
                }
                
                let saveUser = Users(email: loginRequest.email, password: loginRequest.password)
                saveUser.save(on: req)
                
                try response.content.encode(UsersInfo(email: loginRequest.email))
                
                return response
            }
        }
    }
    
    
    router.get("emails") { req in
        return Users.query(on: req).all().map{ users -> [String] in
            return users.map{ user -> String in
                user.email
            }
        }
    }
    
}


