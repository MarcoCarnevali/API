import App
import Vapor
import FluentMySQL

//let apps = try Application()
//let router = try apps.make(Router.self)

//struct User: Content {
//    var name: String
//    var email: String
//}
//
//router.get("user") { req -> User in
//    return User(
//        name: "Vapor User",
//        email: "user@vapor.codes"
//    )
//}
//
//router.get("users") { req in
//    return Users.query(on: req).all()
//}
//
//
//router.post("login") { req -> Future<HTTPStatus> in
//    return try req.content.decode(Users.self).map { loginRequest in
//        print(loginRequest.email) // user@vapor.codes
//        print(loginRequest.password) // don't look!
//        print(loginRequest.id) // ID
//        return HTTPStatus.ok
//    }
//}

try app(.detect()).run()



