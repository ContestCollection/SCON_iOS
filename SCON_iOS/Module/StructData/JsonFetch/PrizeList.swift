//
//  PrizeList.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/04/11.
//

import Foundation

struct PrizeList: Codable {
    let headerList: [PrizeListHeader]
}

struct PrizeListHeader: Codable {
    let id: Int
    let prizeHeader: String
    let prizeListData: [PrizeListData]
}

struct PrizeListData: Codable {
    let id: Int
    let name, subTitle: String
    let img: String
    let infoDetail: InfoDetail
}

struct InfoDetail: Codable {
    let awardDetail, summary, people, calendar: String
    let gitLink, youtubeLink, serviceLink: String
    let skills: String
}
