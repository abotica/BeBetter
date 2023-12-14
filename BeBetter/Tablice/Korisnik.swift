//
//  Korisnik.swift
//  BeBetter
//
//  Created by Andrija Botica on 14.12.2023..
//

import Foundation

struct Korisnik: Encodable{
    var id: UUID?
    var name: String
    var surname: String
    var username: String
    var email: String
    var password: String
    var confirmPassword: String
}
