//
//  PrizeListRepostiory.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/06/16.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case noData                 // 결과 데이터 미존재
    case failDecode             // Decode 실패
    case noURL                 // URL 존재하지 않음
}

protocol PrizeRepositoriable {
    func fetch(field: String, part: String, year: Int, complectionHandler: @escaping(Result<PrizeTeamList,  Error>) -> ())
}

class PrizeListRepostiory: PrizeRepositoriable {
    func fetch(field: String, part: String, year: Int, complectionHandler: @escaping (Result<PrizeTeamList, Error>) -> ()) {
        guard let url = makeGetPrizeListComponents(part: part, year: year).url else { return complectionHandler(.failure(NetworkError.noURL)) }
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
                        complectionHandler(.failure(NetworkError.failDecode))
                        print(debugPrint(error))
                    }
                case let .failure(error):
                    print("ERROR \(error)")
                }
            }
    }
}

private extension PrizeListRepostiory {
    struct PrizeAPI {
        static let scheme = "http"
        static let host = "54.201.143.111:5000"
        static let path = "/ios"
    }
    
    func makeGetPrizeListComponents(part: String, year: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = PrizeAPI.scheme
        components.host = PrizeAPI.host
        components.path = PrizeAPI.path + "/\(part)" + "/\(year)"
        
        return components
    }
}

