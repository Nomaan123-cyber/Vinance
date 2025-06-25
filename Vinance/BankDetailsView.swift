import SwiftUI

struct BankDetailsView: View {
    let sortCode: String
    let accountNumber: String
    let expiryDate: String
    let cvv: String
    let balance: Double
    let firstName: String
    let lastName: String

    init(sortCode: String, accountNumber: String, expiryDate: String, cvv: String, balance: Double, firstName: String, lastName: String) {
        self.sortCode = sortCode
        self.accountNumber = accountNumber
        self.expiryDate = expiryDate
        self.cvv = cvv
        self.balance = balance
        self.firstName = firstName
        self.lastName = lastName
    }

    var body: some View {
        ZStack {
            VStack(spacing: 35) {
                HStack{
                    // Greeting
                    Text("Hi \(firstName)!")
                        .font(.title)
                        .bold()
                        .padding(.top,30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    NavigationLink(destination: UserCardDetailsView(firstname: firstName, lastname: lastName)){
                        VStack{
                            Image("UserCardDetails")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.top,30)
                        }
                        
                        
                    }
                }

                // Bank Card
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green.opacity(0.9), Color.blue.opacity(0.8)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 220)
                        .shadow(radius: 10)

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Vinance")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)

                        Text(String(format: "Balance: £%.2f", balance))
                            .font(.headline)
                            .foregroundColor(.white)

                        Text("Account Number")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        Text(accountNumber)
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)

                        HStack {
                            VStack(alignment: .leading) {
                                Text("Sort Code")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                                Text(sortCode)
                                    .foregroundColor(.white)
                            }

                            Spacer()

                            VStack(alignment: .leading) {
                                Text("Expiry")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                                Text(expiryDate)
                                    .foregroundColor(.white)
                            }

                            Spacer()

                            VStack(alignment: .leading) {
                                Text("CVV")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                                Text(cvv)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                }
               

                // ⬇️ Add the Transactions/Schedule Toggle Card here
                TransactionToggleCard()
                   

                Spacer()
                // Add spending insights here
                Insightbar()
                   
                
                Spacer()
                
            }
            .padding()

            // Bottom Toolbar
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    NavigationLink(destination: BankDetailsView(sortCode: sortCode, accountNumber: accountNumber, expiryDate: expiryDate, cvv: cvv, balance: balance, firstName: firstName, lastName: lastName)) {
                        VStack {
                            Image("Home")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Home")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer()

                    NavigationLink(destination: PaymentsView()) {
                        VStack {
                            Image("Payment")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Payments")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer()

                    NavigationLink(destination: GroupsView()) {
                        VStack {
                            Image("Group")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Groups")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }

                    Spacer()

                    NavigationLink(destination: AccountView()) {
                        VStack {
                            Image("Account")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Account")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
                        

        }
    }
}

// 🔸 Separate view for the toggle card
struct TransactionToggleCard: View {
    @State private var selectedTab: String = "Transactions"

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(hex: 0xFFFDF6))
                .frame(height: 220)
                .shadow(radius: 10)

            VStack(spacing: 16) {
                HStack(spacing: 0) {
                    Button(action: {
                        selectedTab = "Transactions"
                    }) {
                        Text("Transactions")
                            .fontWeight(.bold)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(selectedTab == "Transactions" ? Color.gray.opacity(0.2) : Color.clear)
                            .cornerRadius(12)
                            .foregroundColor(selectedTab == "Transactions" ? .black : .gray)
                    }
                    .padding(.vertical,-40)

                    Spacer()

                    Button(action: {
                        selectedTab = "Scheduled"
                    }) {
                        Text("Scheduled")
                            .fontWeight(.bold)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(selectedTab == "Scheduled" ? Color.gray.opacity(0.2) : Color.clear)
                            .cornerRadius(12)
                            .foregroundColor(selectedTab == "Scheduled" ? .black : .gray)
                    }
                    .padding(.vertical, -40)
                }
                .padding(.horizontal, 16)

                HStack {
                    Text("Recent")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .padding(.horizontal, 18)

                    Spacer()

                    Text("See all")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: 0x1064CB))
                        .padding(.horizontal, 16)
                }
                HStack {
                    Image("Coins")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.horizontal, 12)
                    Text("Credit Genius")
                        .font(.system(size: 12))
                        .padding(.horizontal, -8)
                    Spacer()
                    
                    Text("Declined")
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .padding(.horizontal,16)
                                                
                }
                HStack{
                    Image("Creditcard")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.horizontal, 12)
                    Text("HSBC UK CreditCard")
                        .font(.system(size: 12))
                        .padding(.horizontal, -8)
                    Spacer()
                    
                    Text("£200")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                        .padding(.horizontal, 16)
                }
            }
            .padding(.top, 50)
            
           
        }
       
        
       
                
        }
    }

struct Insightbar: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(hex: 0xFFFDF6))
                .frame(height: 80)
                .shadow(radius: 10)
            HStack{
                
                        Image("Insight")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .padding(.top, 12)
                            .padding(.horizontal)
                        
              
                    
                Text("Spending Insights")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top, 12)
                    .padding(.horizontal, 3)
                
                Spacer()
                
                HStack{
                    NavigationLink(destination: TapInsightsView()){
                        HStack{
                            Image("Rightarrow")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black.opacity(0.8))
                            
                                .padding(.horizontal)
                                .padding(.top, 12)
                        }
                    }
                }
                
                
                
            }
            
        }
        .padding(.top, -35)
        
    }
        
}


// 🔸 Color extension for hex usage

