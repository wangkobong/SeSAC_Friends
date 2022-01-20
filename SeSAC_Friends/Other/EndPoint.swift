//
//  EndPoint.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import Foundation

enum APIError: String, Error {
    case invalidResponse
    case noData
    case failed
    case invalidData = "유효하지 않은 데이터"
}

enum Method: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum EndPoint {
    case checkSignUp
}

extension EndPoint {
    var url: URL {
        switch self {
        case .checkSignUp:
            return .makeEndPoint("user")
        }
    }
}

extension URL {
    static let baseURL = "http://test.monocoding.com:35484/"

    static func makeEndPoint(_ endPoint: String) -> URL {
        return URL(string: baseURL + endPoint)!
    }
}

extension URLSession {

    typealias Handler = (Data?, URLResponse?, Error?) -> Void

    @discardableResult
    func dataTask(_ endpoint: URLRequest, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endpoint, completionHandler: handler)
        task.resume()
        return task
    }

    static func request<T: Decodable> (_ session: URLSession = .shared, endpoint: URLRequest, completion: @escaping (T?, APIError?) -> Void) {
        session.dataTask(endpoint) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(nil, .failed)
                    return
                }

                guard let data = data else {
                    completion(nil, .noData)
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    completion(nil, .invalidResponse)
                    return
                }

                guard response.statusCode == 200 else {
                    completion(nil, .failed)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let userData = try decoder.decode(T.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .invalidData)
                }

            }
        }
    }
}
