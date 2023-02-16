//
//  CarPriceCalculator.swift
//  SolidPrinciples
//
//  Created by Michelle Grover on 2/15/23.
//
import Foundation

class CarPriceGenerator {
    func generatePrice(msrp: Double, blueBookValue: Double, inventoryLevel: Int) -> Double {
        let msrpWeight = 0.6
        let blueBookWeight = 0.3
        let inventoryWeight = 0.1

        let price = (msrp * msrpWeight) + (blueBookValue * blueBookWeight) + (Double(inventoryLevel) * inventoryWeight)

        return price
    }
}

class DiscountedCarPriceGenerator: CarPriceGenerator {
    override func generatePrice(msrp: Double, blueBookValue: Double, inventoryLevel: Int) -> Double {
        let msrpWeight = 0.5
        let blueBookWeight = 0.4
        let inventoryWeight = 0.1

        let discountedMSRP = msrp * 0.9 // Apply a 10% discount on the MSRP
        let discountedBlueBookValue = blueBookValue * 1.1 // Increase the blue book value by 10%
        let price = (discountedMSRP * msrpWeight) + (discountedBlueBookValue * blueBookWeight) + (Double(inventoryLevel) * inventoryWeight)

        return price
    }
}

class PremiumCarPriceGenerator: CarPriceGenerator {
    override func generatePrice(msrp: Double, blueBookValue: Double, inventoryLevel: Int) -> Double {
        let msrpWeight = 0.8
        let blueBookWeight = 0.2

        let premiumPrice = (msrp * msrpWeight) + (blueBookValue * blueBookWeight)

        return premiumPrice
    }
}

