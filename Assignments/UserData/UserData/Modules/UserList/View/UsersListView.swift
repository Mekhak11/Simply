//
//  UsersListView.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 07.10.24.
//

import SwiftUI

struct UsersListView<T: UserDataViewModeling>: View {
    @ObservedObject var viewModel: T
    var columns = Array(repeating:GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            content
                .onLoad(perform: {
                    for i in 1...5 {
                        viewModel.loadUsers(page: i)
                    }
                })
                .navigationTitle("Users")
        }
    }
}

extension UsersListView {
    
    private var content: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: 12,
                content: {
                    list
                }).padding(.horizontal)
            
        }
    }
    
    private var list: some View {
        ForEach(viewModel.users, id: \.login.username) { user in
            NavigationLink(destination: UserDetailsView(user: user)) {
                UserCell(user: user)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    UsersListView(viewModel: UserDataViewModel(networkManager: NetworkManager()))
}
