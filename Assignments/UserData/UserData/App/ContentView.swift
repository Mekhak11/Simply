//
//  ContentView.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 02.10.24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        UsersListView(viewModel: UserDataViewModel(networkManager: NetworkManager()))
    }
}

#Preview {
    ContentView()
}
