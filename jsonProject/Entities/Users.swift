//
//  Users.swift
//  jsonProject
//
//  Created by Abdoulaye Aliou SALL on 15/02/2023.
//

import Foundation

struct User: Identifiable , Codable {
    
    let id :Int
    let prenom : String
    let nom : String
    let role : String
    let motDePasse : String
    let email : String
}
