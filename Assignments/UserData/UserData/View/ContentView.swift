//
//  ContentView.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 02.10.24.
//

import SwiftUI

struct ContentView<T: UserDataViewModeling>: View {
    @ObservedObject var viewModel: T
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: {
                for i in 1...5 {
                    viewModel.loadUsers(page: i)
                }
        })
    }
}

#Preview {
    ContentView(viewModel: UserDataViewModel(networkManager: NetworkManager()))
}
