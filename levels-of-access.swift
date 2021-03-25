struct Cat {    
    public func speak() {
        print("Meeeeoooowww")
    }
    
    internal let color = "Black"
    
    fileprivate var age : Int = 2
    
    private var type = "Ragdoll"
    
}

let scrambles = Cat()

// Could call this from other modules
scrambles.speak()

// Could call this from anywhere within the module
print(scrambles.color)

// Can call this only within this file
print(scrambles.age)

// This is invalid because type is inaccessible outside of the Cat structure
//print(scrambles.type)

struct Office {
    let paperclipCost = 10
    static var paperclipSalesRecord: Int = 0

    private(set) var paperclipSales: Int {
      willSet {
        print("We adjusted the sales to \(newValue) paperclips.")
        if newValue > Office.paperclipSalesRecord {
              Office.paperclipSalesRecord = newValue
            }
            print(Office.paperclipSalesRecord)
      }
      didSet {
        print("Originally, we sold \(oldValue) paperclips.")
      }
    }

    init(paperclipSales: Int) {
      self.paperclipSales = paperclipSales
    }

    var totalRevenue: Int {
      get {
        return (paperclipCost * paperclipSales) + getSecretRevenue()
      }
      set(newTotalRevenue) {
        paperclipSales = (newTotalRevenue - getSecretRevenue()) / paperclipCost 
      }
    }

    private func getSecretRevenue() -> Int {
      return 100
    }

    func printTotalRevenue() {
        //let totalRevenue = paperclipSales * paperclipCost + getSecretRevenue()
        print("Our total revenue this month is \(totalRevenue).")
    }
}

var alphaOffice = Office(paperclipSales: 18)
alphaOffice.totalRevenue = 400

alphaOffice.printTotalRevenue()
print(alphaOffice.totalRevenue)
// let invalidAccess = alphaOffice.paperclipSales
// alphaOffice.getSecretRevenue()
print(alphaOffice.paperclipSales)
// alphaOffice.paperclipSales = 48 -> Error! Variable can't change value


