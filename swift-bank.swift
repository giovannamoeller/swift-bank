struct SwiftBank {
    private let password: String
    private var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    static let depositBonusRate: Double = 0.01
    
    init(initialDeposit: Double, password: String) {
        self.password = password
        makeDeposit(ofAmount: initialDeposit)
    }
    
    private func isValid(_ enteredPassword: String) -> Bool {
        return enteredPassword == self.password
    }
    
    
    private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        if deposit >
        deposit + (deposit * SwiftBank.depositBonusRate)
    }
    
    mutating func makeDeposit(ofAmount depositAmount: Double) {
        balance += finalDepositWithBonus(fromInitialDeposit: depositAmount)
        print("Making a $\(depositAmount) deposit")
    }
    
    func displayBalance(usingPassword password: String) {
        if(!isValid(password)) {
            print("Error: Invalid Password. Cannot retrieve balance")
            return
        } else {
            print("Your current balance is $\(balance)")
        }
    }
    
    mutating func makeWithdrawal(ofAmount withdrawal: Double, usingPassword password: String) {
        if(!isValid(password)) {
            print("Error: Invalid Password. Cannot make withdrawal")
            return
        } else {
            balance -= withdrawal
            print("Making a $\(withdrawal) withdrawal")
        }
    }
    
    private func displayLowBalanceMessage() {
        print("Alert: Your balance is under $100")
    }
}

let myAccount = SwiftBank(initialDeposit: 500, password: "password")
myAccount.makeDeposit(ofAmount: 50)
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "incorrect")
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "password")
myAccount.displayBalance(usingPassword: "password")
