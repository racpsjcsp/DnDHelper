//
//  ClassList.swift
//  DnD Helper
//
//  Created by Rafael Plinio on 27/06/21.
//

import Foundation

struct ClassList: Codable {
    let results: [CharClass]
}

struct CharClass: Codable {
    let name: String
    let url: String
}
