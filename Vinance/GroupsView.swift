import SwiftUI


struct InitialCircleView: View {
    let fullName: String
    let backGroundColor: Color
    
    var initials: String {
        let nameComponents = fullName.split(separator: " ")
        let firstInitial = nameComponents.first?.first.map { String($0) } ?? ""
        let lastInitial = nameComponents.dropFirst().first?.first.map { String($0) } ?? ""
        return (firstInitial + lastInitial).uppercased()
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(backGroundColor)
                .frame(width: 60, height: 60)
            
            
            Text(initials)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
        }
    }
}

import SwiftUI

struct GroupsView: View {
    
    let people = ["Fabiha Khan", "Ali Raza", "John Doe", "Fatima Sayed"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: 0xF5EFFF) // light lavender background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("People")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                
                                Spacer()
                                
                                Text("See all")
                                    .foregroundColor(.blue)
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(people, id: \.self) { name in
                                        InitialCircleView(fullName: name, backGroundColor: Color(hex: 0xDDDDDD))
                                    }
                                }
                                .padding(.bottom, 8)
                                .padding(.horizontal)
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                        .padding(.top)
                        
                        Spacer()
                    }
                    VStack(spacing: 16){
                        Text("Groups")
                            .fontWeight(.semibold)
                            .font(.title2)
                    }
                    
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 1)
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
        }
    }
}






#Preview{
    GroupsView()
}
