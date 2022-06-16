//
//  ContestList.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/04/10.
//

import Foundation

struct ContestList: Codable {
    let data: [ContestSort]
    
    struct ContestSort: Codable {
        let id: Int
        let name: String
        let icon: String
    }
}
