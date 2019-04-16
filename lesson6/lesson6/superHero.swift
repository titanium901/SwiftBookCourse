//
//  marvelApi.swift
//  lesson6
//
//  Created by Yury Popov on 15/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation

struct Hero: Decodable {
    var response: String?
    var id: String?
    var name: String?
    var url: String?
}

var id = Int.random(in: 1...731)

