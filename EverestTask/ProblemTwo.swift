//
//  ProblemTwo.swift
//  EverestTask
//
//  Created by Muhammad Zeeshan on 19/10/2023.
//

import Foundation

let baseDeliveryCost = 100
var noOfPackages = 5
var noOfVehicles = 2
let maxSpeed = 70.0
let maxLoad = 200.0
var currentTime = 0.0

var collectionWeightSet: [(Int, Int, Double)] = []
var deliveredPkgs: [Package] = []
var remainingPkgs: [Package] = []

func getEstimatedDeliveryTime(for packages: [Package]) {
    remainingPkgs = packages
    for i in 0..<remainingPkgs.count {
        for j in 0..<i {
            if i != j {
                if checkSumOfWeights(pkg1: remainingPkgs[i], pkg2: remainingPkgs[j]).2 != 0.0  {
                    collectionWeightSet.append(checkSumOfWeights(pkg1: remainingPkgs[i], pkg2: remainingPkgs[j]))
                }
            }
        }
    }
    while noOfVehicles != 0 {
        showDeliveryTimeOfPackages(collectionSet: collectionWeightSet)
        noOfVehicles -= 1
    }
}

func showDeliveryTimeOfPackages(collectionSet: [(Int, Int, Double)]) {
    var sortedPkgs = remainingPkgs.sorted(by: { $0.weight > $1.weight })
    if let maxItem = collectionSet.max(by: { $0.2 < $1.2 }) {
        let pkg1 = maxItem.0 - 1
        let pkg2 = maxItem.1 - 1
        var vehicle1Time = 0.0
        if deliveredPkgs.contains(where: { $0.id == maxItem.0 || $0.id == maxItem.1 }) {
            while !sortedPkgs.isEmpty {
                if let maxFromRemainingPkg = sortedPkgs.sorted(by: { $0.weight > $1.weight }).max(by: { $0.weight < $1.weight }) {
                    print("Delivering PKG\(sortedPkgs[0].id) in", String(format: "%.2f", calculateDeliveryTime(for: sortedPkgs[0])), "hrs")
                    deliveredPkgs.append(maxFromRemainingPkg)
                }
                sortedPkgs.remove(at: 0)
            }
        } else {
            print("Delivering PKG\(maxItem.1) in", String(format: "%.2f", calculateDeliveryTime(for: remainingPkgs[maxItem.1 - 1])), "hrs")
            print("Delivering PKG\(maxItem.0) in", String(format: "%.2f", calculateDeliveryTime(for: remainingPkgs[maxItem.0 - 1])), "hrs")
            
            if calculateDeliveryTime(for: remainingPkgs[pkg1]) > calculateDeliveryTime(for: remainingPkgs[pkg2]) {
                vehicle1Time = calculateDeliveryTime(for: remainingPkgs[pkg1]) * 2.0
            } else {
                vehicle1Time = calculateDeliveryTime(for: remainingPkgs[pkg2]) * 2.0
            }
            
            print("Vehicle 01 will be available after", String(format: "%.2f", vehicle1Time), "hrs")
            
            deliveredPkgs.append(remainingPkgs[pkg1])
            deliveredPkgs.append(remainingPkgs[pkg2])
            remainingPkgs.remove(at: pkg1)
            remainingPkgs.remove(at: pkg2)
            collectionWeightSet.removeAll(where: { $0 == maxItem })
        }
    }
}

func checkSumOfWeights(pkg1: Package, pkg2: Package) -> (Int, Int, Double) {
    let sum = pkg1.weight + pkg2.weight
    if sum <= maxLoad {
        return (pkg1.id, pkg2.id, sum)
    }
    return (0, 0, 0.0)
}

func calculateDeliveryTime(for package: Package) -> Double {
    return package.distanceToDestination / maxSpeed
}


// if maxWeightPkgs.contains (where: { $0.id == remainingPackages[i].id }) {} else {}
