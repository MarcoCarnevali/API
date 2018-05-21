//
//  Users.swift
//  APIPackageDescription
//
//  Created by Marco Carnevali on 20/05/18.
//

import Vapor
import FluentMySQL

/// A simple user.
public final class Users: MySQLModel,Content {
    /// The unique identifier for this user.
    public var id: Int?
    
    /// The user's full name.
    public var email: String
    
    /// The user's current age in years.
    public var password: String
    
    /// Creates a new user.
    init(id: Int? = nil, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
    
}

