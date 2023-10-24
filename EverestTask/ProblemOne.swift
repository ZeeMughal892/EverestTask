//
//  ProblemOne.swift
//  EverestTask
//
//  Created by Muhammad Zeeshan on 19/10/2023.
//
import Foundation

enum Offers: Int {
    case OFR001 = 10
    case OFR002 = 7
    case OFR003 = 5
    case OFR008 = 0
}

class Package {
    var id: Int
    var weight: Double
    var distanceToDestination: Double
    var offerCode: Offers.RawValue = 0
 
    init(id: Int, weight: Double, distanceToDestination: Double, offerCode: Offers.RawValue = 0) {
        self.id = id
        self.weight = weight
        self.distanceToDestination = distanceToDestination
        self.offerCode = offerCode
    }
}

func getDiscountedDeliveryCost(for package: Package) {
    var discount = 0
    var deliveryCost = 0
    
    deliveryCost = baseDeliveryCost + (Int(package.weight) * 10) + (Int(package.distanceToDestination) * 5)
    
    if package.weight > 0 && package.distanceToDestination > 0 {
        print("Total Delivery Cost = \(deliveryCost)")
        if package.distanceToDestination < 200 && (70..<200).contains(package.weight) {
            discount = (deliveryCost * package.offerCode) / 100
            deliveryCost = deliveryCost - discount
        } else if (50..<150).contains(package.distanceToDestination) && (100..<250).contains(package.weight) {
            discount = (deliveryCost * package.offerCode) / 100
            deliveryCost = deliveryCost - discount
        } else if (50..<250).contains(package.distanceToDestination) && (10..<150).contains(package.weight) {
            discount = (deliveryCost * package.offerCode) / 100
            deliveryCost = deliveryCost - discount
        }
        print("PKG\(package.id) Discount = \(discount)", "After Discount Total Delivery Cost = \(deliveryCost)")
    } else {
        print("Negative Value are not permitted")
    }
}

