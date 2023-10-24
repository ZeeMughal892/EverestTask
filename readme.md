Input Values for Problem One

var pkgs: [Package] = [
    Package(id: 1, weight: 5.0, distanceToDestination: 5.0, offerCode: Offers.OFR001.rawValue),
    Package(id: 2, weight: 5.0, distanceToDestination: 15.0, offerCode: Offers.OFR002.rawValue),
    Package(id: 3, weight: 10.0, distanceToDestination: 100.0, offerCode: Offers.OFR003.rawValue)
]

Input Values for Problem Two
var packages: [Package] = [
    Package(id: 1, weight: 50.0, distanceToDestination: 30.0, offerCode: Offers.OFR001.rawValue),
    Package(id: 2, weight: 75.0, distanceToDestination: 125.0, offerCode: Offers.OFR008.rawValue),
    Package(id: 3, weight: 175.0, distanceToDestination: 100.0, offerCode: Offers.OFR003.rawValue),
    Package(id: 4, weight: 110.0, distanceToDestination: 60.0, offerCode: Offers.OFR002.rawValue),
    Package(id: 5, weight: 155.0, distanceToDestination: 95.0)
]


getDiscountedDeliveryCost(for: pkg) // for Problem One Solution Pass Single package to this Function

getEstimatedDeliveryTime(for: packages) // for Problem Two Solution Pass array of package to this Function
