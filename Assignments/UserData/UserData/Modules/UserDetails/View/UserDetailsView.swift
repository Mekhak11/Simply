//
//  UserDetailsView.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 08.10.24.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        content
            .padding()
            .navigationTitle("\(user.name.first)'s Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

extension UserDetailsView {
    private var content: some View {
        ScrollView {
            VStack {
                upperContent
                    .padding(.top, 30)
                
                Divider()
                    .padding(.vertical, 10)
                
                lowerContent
                    .padding(.horizontal)
                
                Spacer()
            }
        }
    }
    
    private var upperContent: some View {
        VStack(spacing: 10) {
            image
            name
            username
            location
        }
    }
    
    @ViewBuilder
    private var image: some View {
        if let imageUrl = URL(string: user.picture.large) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .background(Color(.systemGray6))
                    .frame(width: 80, height: 80)
            }
        }
    }
    private var name: some View {
        Text("\(user.name.first) \(user.name.last)")
            .font(.title)
            .fontWeight(.bold)
    }
    private var username: some View {
        Text("@\(user.login.username)")
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
    private var location: some View {
        Text("\(user.location.city), \(user.location.country)")
            .font(.body)
            .foregroundStyle(.gray)
    }
    
    private var lowerContent: some View {
        VStack(alignment: .leading, spacing: 15) {
            phone
            cell
            mail
            birthDay
            registration
        }
    }
    private var phone: some View {
        HStack {
            Image(systemName: "phone.fill")
            Text(user.phone)
        }
        .font(.subheadline)
    }
    private var cell: some View {
        HStack {
            Image(systemName: "iphone")
            Text(user.cell)
        }
        .font(.subheadline)
    }
    private var mail: some View {
        HStack {
            Image(systemName: "envelope.fill")
            Text(user.email)
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .font(.subheadline)
    }
    private var birthDay: some View {
        HStack {
            Image(systemName: "calendar")
            Text("DOB: \(user.dob.date)")
        }
        .font(.subheadline)
    }
    private var registration: some View {
        HStack {
            Image(systemName: "clock.fill")
            Text("Registered: \(user.registered.date)")
        }
        .font(.subheadline)
    }
}



#Preview {
    UserDetailsView(user: User(gender: .male, name: Name(title: "Mr", first: "Mekhak", last: "Ghapantsyan"), location: Location(street: Street(number: 60, name: "Leo"), city: "Yerevan", state: "State", country: "Armenia", postcode: "0012", coordinates: Coordinates(latitude: "43.12", longitude: "34.12"), timezone: Timezone(offset: "off", description: "desc")) , email: "ascas@gmail.com", login: Login(uuid: "id", username: "mghapantsyan", password: "admin123", salt: "", md5: "", sha1: "", sha256: ""), dob: Dob(date: "11.05.2003", age: 21), registered: Dob(date: "13.12.2000", age: 21), phone: "37477777777", cell: "", id: ID(name: "", value: ""), picture: Picture(large: "", medium: "", thumbnail: ""), nat: ""))
}
