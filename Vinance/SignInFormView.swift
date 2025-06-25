import SwiftUI

struct SignInFormView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dob = Date()
    @State private var contactNumber = ""
    @State private var Email = ""
    @State private var Password = ""
    @State private var address = ""
    @State private var sortCode = ""
    @State private var accountNumber = ""
    @State private var expiryDate = ""
    @State private var cvv = ""
    @State private var balance: Double = 0.0
    @State private var showBankDetails = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Vinance")
                .font(.custom("Inter-Regular", size: 40))
                .bold()
                .foregroundColor(Color(hex: 0x009951))
                .padding(.top, 40)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .center)

            Group {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                DatePicker("Date of Birth", selection: $dob, displayedComponents: .date)
                TextField("Contact Number", text: $contactNumber)
                    .keyboardType(.phonePad)
                TextField("Address", text: $address)
                TextField("Email", text: $Email)
                TextField("Password", text: $Password)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Create account") {
                generateBankDetails()
                showBankDetails = true
            }
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, 20)

            Spacer()
        }
        .padding(30)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $showBankDetails) {
            BankDetailsView(
                sortCode: sortCode,
                accountNumber: accountNumber,
                expiryDate: expiryDate,
                cvv: cvv,
                balance: balance,
                firstName: firstName,
                lastName: lastName
            )
        }
    }

    func generateBankDetails() {
        let sortCodeNumbers = (1...6).map { _ in Int.random(in: 0...9) }
        sortCode = "\(sortCodeNumbers[0])\(sortCodeNumbers[1])-\(sortCodeNumbers[2])\(sortCodeNumbers[3])-\(sortCodeNumbers[4])\(sortCodeNumbers[5])"

        accountNumber = (1...8).map { _ in String(Int.random(in: 0...9)) }.joined()

        let month = Int.random(in: 1...12)
        let year = Calendar.current.component(.year, from: Date()) + Int.random(in: 1...5)
        expiryDate = String(format: "%02d/%02d", month, year % 100)

        cvv = (1...3).map { _ in String(Int.random(in: 0...9)) }.joined()
        balance = Double.random(in: 500.0...100000.0)
    }
}
