//
//  Genre.swift
//  FilmUygulamasi
//
//  Created by Opendart Yazılım ve Bilişim Hizmetleri on 15.06.2022.
//

import Foundation

struct Genre : Codable {
    var genres : [Genres]?
}

struct Genres : Codable {
    var  id : Int?
    var name : String?
}
