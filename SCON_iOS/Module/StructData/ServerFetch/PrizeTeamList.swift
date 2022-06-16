//
//  PrizeTeamList.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/06/16.
//

import Foundation

struct PrizeTeamList: Decodable {
    let headerList: [HeaderList]?
    
    struct HeaderList: Decodable {
        let id: Int
        let prizeHeader: String
        let prizeListData: [PrizeListData]?
        
        struct PrizeListData: Decodable {
            let id: Int
            let img: String
            let infoDetail: InfoDetail
            let name, subTitle: String
            
            struct InfoDetail: Decodable {
                let awardDetail, calendar, gitLink, people: String
                let serviceLink, skills, summary, youtubeLink: String
            }
        }
        
    }
}
