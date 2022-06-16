//
//  PrizeListRepostiory.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/06/16.
//

import Foundation
import Alamofire

protocol PrizeRepositoriable {
    func fetch(field: String, part: String, year: Int, complectionHandler: @escaping(Result<PrizeTeamList,  Error>) -> ())
}

class PrizeListRepostiory: PrizeRepositoriable {
    func fetch(field: String, part: String, year: Int, complectionHandler: @escaping (Result<PrizeTeamList, Error>) -> ()) {
        let url = "http://54.201.143.111:5000/ios"
        AF.request(url,
                   method: .get)
            .responseData { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(PrizeTeamList.self, from: data)
                        complectionHandler(.success(result))
                    } catch {
                        complectionHandler(.failure(error))
                        print(debugPrint(error))
                    }
                case let .failure(error):
                    print("ERROR \(error)")
                }
            }
    }
}
