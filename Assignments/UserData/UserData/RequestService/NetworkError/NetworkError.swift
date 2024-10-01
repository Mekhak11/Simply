//
//  NetworkError.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 02.10.24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case decodingError(Error)
    case unknown(Error)
}
