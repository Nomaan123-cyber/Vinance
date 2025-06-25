import SwiftUI

struct AccountView: View {
    @State private var animateEducationIcon = false
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(hex: 0xF5EFFF) // light lavender background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // 🔹 Top Tile Cards
                        HStack(spacing: 12) {
                            cardTile(icon: "creditcard", title: "Standard", subtitle: "Your plan")
                            cardTile(icon: "person.crop.circle.badge.plus", title: "Invite friends", subtitle: "Earn £50 or more")
                        }
                        .padding(.horizontal)
                        
                        // 🔹 Menu Section 1
                        VStack(spacing: 0) {
                            menuItem(icon: "questionmark.circle.fill", title: "Help")
                            menuItem(icon: "person.fill", title: "Account")
                            menuItem(icon: "doc.fill", title: "Documents & statements")
                            menuItem(icon: "lightbulb.fill", title: "Learn")
                            menuItem(icon: "megaphone.fill", title: "Inbox")
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                        
                        // 🔹 Menu Section 2
                        VStack(spacing: 0) {
                            menuItem(icon: "shield.fill", title: "Security")
                            menuItem(icon: "bell.fill", title: "Notification settings")
                            menuItem(icon: "paintpalette.fill", title: "Appearance")
                            menuItem(icon: "figure.walk", title: "Accessibility")
                            menuItem(icon: "sparkles", title: "New features")
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                        
                        // 🔹 Menu Section 3
                        VStack(spacing: 0) {
                            menuItem(icon: "r.circle.fill", title: "About us")
                            menuItem(icon: "rectangle.portrait.and.arrow.forward.fill", title: "Logout")
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                        
                        
                        // 🔹 Menu Section 4
                        VStack(spacing: 0) {
                            menuItemWithAnimation(icon: "graduationcap.fill", title: "Education", animate: animateEducationIcon)
                            
                        }
                        
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                        .onAppear{
                            
                            animateEducationIcon = true
                            
                        }
                        
                    }
                    .padding(.top)
                }
            }
            .navigationBarHidden(false)
        }
    }
}
func cardTile(icon: String, title: String, subtitle: String) -> some View {
    VStack(alignment: .leading, spacing: 6) {
        Image(systemName: icon)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(.blue)
        Text(title)
            .bold()
        Text(subtitle)
            .font(.caption)
            .foregroundColor(.gray)
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.white)
    .cornerRadius(16)
    .shadow(radius: 1)
}

func menuItem(icon: String, title: String) -> some View {
    HStack {
        Image(systemName: icon)
            .foregroundColor(.black)
            .frame(width: 24, height: 24)
        Text(title)
            .foregroundColor(.black)
        Spacer()
    }
    .padding(.vertical, 14)
    .padding(.horizontal)
    .background(Color.white)
}

@ViewBuilder
func menuItemWithAnimation(icon: String, title: String, animate: Bool) -> some View {
    HStack {
        Image(systemName: icon)
            .foregroundColor(.black)
            .frame(width: 24, height: 24)
            .symbolEffect(.pulse, value: animate) // or .rotate
        Text(title)
            .foregroundColor(.black)
        Spacer()
    }
    .padding(.vertical, 14)
    .padding(.horizontal)
    .background(Color.white)
}

