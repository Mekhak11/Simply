//
//  NetworkManager.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 02.10.24.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ target: TargetType, type: T.Type) -> AnyPublisher<T, NetworkError>
}

class NetworkManager: NetworkManagerProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ target: TargetType, type: T.Type) -> AnyPublisher<T, NetworkError> {
        guard var urlComponents = URLComponents(url: target.baseURL.appendingPathComponent(target.path), resolvingAgainstBaseURL: false) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        if let parameters = target.parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        guard let url = urlComponents.url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method
        if let headers = target.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.responseError
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return .decodingError(decodingError)
                } else {
                    return .unknown(error)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
