import SwiftUI
import SwiftData

extension Color {
    init(hex: UInt, alpha: Double = 1.0)
    {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

struct ContentView: View {
    @State private var animate = false
    var body: some View{
        NavigationStack{
            VStack{
                Text("Vinance").font(.custom("Inter-Regular", size: 96))
                    .foregroundColor(Color(hex: 0x009951))
                    .bold()
                    .padding(.top,100.0)
                    .scaleEffect(animate ? 1.0 : 0.6)
                    .opacity(animate ? 1.0 : 0.0)
                    .padding(.top, 100.0)
                    .onAppear {
                        withAnimation(.easeOut(duration: 1.2)) {
                            animate = true
                        }
                    }
                    .padding(.bottom,-22)
                Text("Reimagining FinTech: Learn, Invest, and Bank Better"
                )
                .font(.custom("Inter-Regular", size: 24))
                .fontWeight(.bold)
                .padding(.horizontal,6)
                .padding(.vertical)
                
                
                Spacer()
                Button(action: {
                    
                }){
                    NavigationLink(destination: SignInFormView())  {
                        Text("Get Started")
                            .font(.custom("Inter-Regular", size: 24))
                            .fontWeight(.bold)
                        
                        
                            .foregroundColor(.white)  // Text color inside button
                            .padding()     // Padding inside button
                            .frame(maxWidth: .infinity) // Make button stretch horizontally if you want
                            .background(.black)  // Background color of button
                        //.cornerRadius(12)   // Rounded corners
                            .overlay(
                                Capsule()
                                    .stroke(Color.black, lineWidth: 2)  // Stroke (border)
                            )
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal, 30) // Padding around button so it doesn’t touch screen edges
                    .padding(.bottom, 35)
                    
                }
                
                Button(action: {
                    
                }) {
                    Text("Login")
                        .font(.custom("Inter-Regular", size: 24))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hex: 0x009951))  // Text color inside button
                        .padding()         // Padding inside button
                        .frame(maxWidth: .infinity) // Make button stretch horizontally if you want
                        .background(.white)  // Background color of button
                        .cornerRadius(12)    // Rounded corners
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 2)  // Stroke (border)
                        )
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal, 30) // Padding around button so it doesn’t touch screen edges
                .padding(.bottom, 50)
            }
        }
    }
    
}



#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
