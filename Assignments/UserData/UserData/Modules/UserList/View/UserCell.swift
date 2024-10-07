//
//  UserCell.swift
//  UserData
//
//  Created by MEKHAK GHAPANTSYAN on 07.10.24.
//

import SwiftUI

struct UserCell: View {
    var user: User
    var body: some View {
        content
    }
}

extension UserCell {
    
    private var content: some View {
        VStack(spacing: 10) {
            image
            name
            location
        }
        .padding()
        .frame(width: 160,height: 240)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 4)
    }
    
    @ViewBuilder
    private var image: some View {
        if let imageUrl = URL(string: user.picture.medium) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .background(Color(.systemGray6))
                    .frame(width: 80, height: 80)
            }
        }
    }
    
    private var name :some View {
        Text("\(user.name.first) \(user.name.last)")
            .font(.subheadline)
            .fontWeight(.bold)
            .lineLimit(1)
    }
    
    private var location: some View {
        Text("\(user.location.city), \(user.location.country)")
            .font(.caption)
            .foregroundColor(.secondary)
            .lineLimit(1)
    }
}

#Preview {
    UserCell(user: User(gender: .male, name: Name(title: "Mr", first: "Mekhak", last: "Ghapantsyan"), location: Location(street: Street(number: 60, name: "Leo"), city: "Yerevan", state: "State", country: "Armenia", postcode: "0012", coordinates: Coordinates(latitude: "43.12", longitude: "34.12"), timezone: Timezone(offset: "off", description: "desc")) , email: "ascas@gmail.com", login: Login(uuid: "id", username: "mghapantsyan", password: "admin123", salt: "", md5: "", sha1: "", sha256: ""), dob: Dob(date: "11.05.2003", age: 21), registered: Dob(date: "13.12.2000", age: 21), phone: "37477777777", cell: "", id: ID(name: "", value: ""), picture: Picture(large: "", medium: "", thumbnail: ""), nat: ""))
}
