import SwiftUI
import Foundation

func generateMasterCardNumber() -> String {
    // Choose a realistic MasterCard prefix
    let prefixOptions = [
        "51", "52", "53", "54", "55",
        "2221", "2230", "2299", "2700", "2720"
    ]
    let prefix = prefixOptions.randomElement()!

    let remainingLength = 16 - prefix.count
    let randomDigits = (0..<remainingLength).map { _ in String(Int.random(in: 0...9)) }

    return prefix + randomDigits.joined()
}

func generateRandomCVV() -> String {
    return String(format: "%03d", Int.random(in: 0...999))
}

func generateRandomExpiryDate() -> String {
    let month = Int.random(in: 1...12)
    let year = Int.random(in: 25...30)
    return String(format: "%02d/%02d", month, year)
}
struct UserCardDetailsView: View {
    let firstname : String
    let lastname: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 🔹 Title
            Text("My Card")
                .font(.title)
                .bold()
                .padding(.horizontal)

            // 🔹 Virtual Card
            VirtualDebitCardView(
                customerName: "\(firstname) \(lastname)",
                cardNumber: generateMasterCardNumber(),
                expiryDate: generateRandomExpiryDate(),
                cvv: generateRandomCVV()
            )

            Spacer()
        }
        .padding(.top)
    }
}
struct VirtualDebitCardView: View {
    let customerName: String
    let cardNumber: String
    let expiryDate: String
    let cvv: String
    
    
    @State private var isMasked: Bool = true
    @State private var showCopied: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.clear)
                .background(
                    ZStack {
                        // Base dark metallic tone
                        LinearGradient(
                            gradient: Gradient(colors: [Color(hex: 0x009951), Color(hex: 0x00663D)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        
                        // Subtle horizontal brushed lines (metal texture illusion)
                        VStack(spacing: 1) {
                            ForEach(0..<100) { _ in
                                Color.white.opacity(0.02).frame(height: 1)
                                Color.clear.frame(height: 1)
                            }
                        }
                        
                        // Optional: diagonal shine
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.05), Color.clear]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                )
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.4), radius: 12, x: 0, y: 6)
            
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Vinance")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Image("Mastercard")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                
                
                // Card Number
                HStack(spacing: 8) {
                    Text(isMasked ? maskedCardNumber(cardNumber) : formattedCardNumber(cardNumber))
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                        .onTapGesture {
                            UIPasteboard.general.string = cardNumber
                            showCopied = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                showCopied = false
                            }
                        }
                    
                    Button(action: {
                        isMasked.toggle()
                    }) {
                        Image(systemName: isMasked ? "eye.slash" : "eye")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Card Holder")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text(customerName.uppercased())
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expires")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text(expiryDate)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("CVV")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text(isMasked ? "***": cvv)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal)
        
        VStack{
            Image("ApplePay")
                .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 138)
            Text("Add to Apple Wallet")
                .font(.system(size: 12))
                .foregroundColor(.black)
                
        }
    }
    
    // Format card number into 4-digit blocks
    func formattedCardNumber(_ number: String) -> String {
        number.enumerated().map { index, char in
            index % 4 == 0 && index != 0 ? " \(char)" : String(char)
        }.joined()
    }
    func maskedCardNumber(_ number: String) -> String {
        let last4 = number.suffix(4)
        return "**** **** **** \(last4)"
    }
}


