//
//  ContentView.swift
//  SolidPrinciples
//
//  Created by Michelle Grover on 2/15/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    let makes = ["Honda", "Toyota", "Ford"]
    let hondaModels = ["Accord", "Civic", "CR-V"]
    let toyotaModels = ["Camry", "Corolla", "RAV4"]
    let fordModels = ["Escape", "F-150", "Mustang"]
    let years = ["2021", "2020", "2019"]

    @State private var selectedMake = 0
    @State private var selectedModel = 0
    @State private var selectedYear = 0
    @State private var calculatedPrice = 0.0

    var body: some View {
        VStack {
            Spacer()
            Text("Car Price Calculator")
                .font(.largeTitle)
                .padding(.bottom)

            Picker(selection: $selectedMake, label: Text("Make")) {
                ForEach(0 ..< makes.count) {
                    Text(self.makes[$0])
                }
            }

            Picker(selection: $selectedModel, label: Text("Model")) {
                ForEach(getModels(), id: \.self) {
                    Text($0)
                }
            }

            Picker(selection: $selectedYear, label: Text("Year")) {
                ForEach(0 ..< years.count) {
                    Text(self.years[$0])
                }
            }

            Button(action: {
                calculatedPrice = calculatePrice()
            }) {
                Text("Calculate")
            }
            Spacer()
                .frame(height: 30)
            Text("Price: $\(calculatedPrice, specifier: "%.2f")")
                .font(.headline)

            Spacer()
        }
    }

    func getModels() -> [String] {
        switch selectedMake {
        case 0:
            return hondaModels
        case 1:
            return toyotaModels
        case 2:
            return fordModels
        default:
            return []
        }
    }

    func calculatePrice() -> Double {
        let msrp = getMSRP()
        let blueBookValue = getBlueBookValue()
        let inventoryLevel = getInventoryLevel()

        let msrpWeight = 0.6
        let blueBookWeight = 0.3
        let inventoryWeight = 0.1

        let price = (msrp * msrpWeight) + (blueBookValue * blueBookWeight) + (Double(inventoryLevel) * inventoryWeight)

        return price
    }

    func getMSRP() -> Double {
        // Code to get the MSRP of the selected car make, model, and year
        return 20000
    }

    func getBlueBookValue() -> Double {
        // Code to get the blue book value of the selected car make, model, and year
        return 15000
    }

    func getInventoryLevel() -> Int {
        // Code to get the inventory level of the selected car make, model, and year
        return 10
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
