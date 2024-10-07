//
//  UserDataViewModel.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 02.10.24.
//

import Foundation
import Combine

class UserDataViewModel: UserDataViewModeling {
    
    @Published var users: [User] = []
    private var cancellables = Set<AnyCancellable>()
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func loadUsers(page: Int) {
        networkManager.request(UserRoute.getUsers(page: page, results: 10), type: UserDataResult.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                guard let result = response.results else { return }
                self?.users += result
                DispatchQueue.main.async {
                    result.forEach({ user in
                        print(user.name.title,user.name.first, user.name.last, separator: " ")
                        print(user.location.street,user.location.country, user.location.city, separator: " ")
                    })
                    print(response.info)
                }
            })
            .store(in: &cancellables)
    }
}
