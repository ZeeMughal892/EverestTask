//
//  main.swift
//  EverestTask
//
//  Created by Muhammad Zeeshan on 19/10/2023.
//
import Foundation

var packages: [Package] = [
    Package(id: 1, weight: 50.0, distanceToDestination: 30.0, offerCode: Offers.OFR001.rawValue),
    Package(id: 2, weight: 75.0, distanceToDestination: 125.0, offerCode: Offers.OFR008.rawValue),
    Package(id: 3, weight: 175.0, distanceToDestination: 100.0, offerCode: Offers.OFR003.rawValue),
    Package(id: 4, weight: 110.0, distanceToDestination: 60.0, offerCode: Offers.OFR002.rawValue),
    Package(id: 5, weight: 155.0, distanceToDestination: 95.0)
]

var pkgs: [Package] = [
    Package(id: 1, weight: 5.0, distanceToDestination: 5.0, offerCode: Offers.OFR001.rawValue),
    Package(id: 2, weight: 5.0, distanceToDestination: 15.0, offerCode: Offers.OFR002.rawValue),
    Package(id: 3, weight: 10.0, distanceToDestination: 100.0, offerCode: Offers.OFR003.rawValue)
]


//  Problem One
print("*** PROBLEM ONE***\n")
for pkg in pkgs {
    getDiscountedDeliveryCost(for: pkg)
}

print("\n*** PROBLEM TWO***\n")
// Problem Two 
getEstimatedDeliveryTime(for: packages)

