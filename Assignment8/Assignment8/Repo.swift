
//
//  Repo.swift
//  Assignment8
//
//  Created by SubaruShiozaki on 2019-05-08.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import Foundation

class Repo: Decodable {
    let id: Int
    let name: String
    let full_name: String
    let clone_url:String
    let created_at: Date
}
