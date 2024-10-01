//
//  UserDataViewModeling.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 02.10.24.
//

import Foundation

protocol UserDataViewModeling: ObservableObject {
    var users: [User] { get }
    
    func loadUsers(page: Int)
}
