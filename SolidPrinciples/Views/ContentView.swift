//
//  ContentView.swift
//  SolidPrinciples
//
//  Created by Michelle Grover on 2/15/23.
//

import SwiftUI

struct ContentView: View {
    let discountedCarPriceGenerator = CarPriceGenerator()
    
    @State var msrp = 30000.0
    @State var blueBookValue = 25000.0
    @State var inventoryLevel = 10
    @State var calculatedPrice = 0.0

    var body: some View {
        VStack {
            Text("Enter Car Information")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Form {
                Section(header: Text("MSRP")) {
                    TextField("Enter MSRP", value: $msrp, formatter: NumberFormatter())
                }

                Section(header: Text("Blue Book Value")) {
                    TextField("Enter Blue Book Value", value: $blueBookValue, formatter: NumberFormatter())
                }

                Section(header: Text("Inventory Level")) {
                    Stepper("Inventory: \(inventoryLevel)", value: $inventoryLevel, in: 0...1000)
                }

                Section(header: Text("Calculate Price")) {
                    Button("Calculate") {
                        calculatedPrice = discountedCarPriceGenerator.generatePrice(msrp: msrp, blueBookValue: blueBookValue, inventoryLevel: inventoryLevel)
                    }
                }
            }

            Spacer()

            Text("Calculated Price: $\(String(format: "%.2f", calculatedPrice))")
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
