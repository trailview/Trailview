//
//  ParksAPIResponse.swift
//  Trailview
//
//  Created by Reid Strange on 11/12/21.
//

import Foundation

struct ParksAPIResponse: Decodable {
    let total: String
    let limit: String
    let start: String
    let data: [Park]
}

struct Park: Decodable {
//    let id: String
//    let url: String
    let fullName: String
//    let parkCode: String
    let description: String
    let latitude: String
    let longitude: String
//    let latLong: String
//    let activities: [Activity]
//    let topics: [Topic]
//    let states: String
//    let contacts: Contacts
//    let entranceFees: [EntranceFee]
//    let entrancePasses: [EntrancePass]
//    let fees: [Fee]
//    let directionsInfo: String
//    let directionsUrl: String
//    let operatingHours: [Hours]
//    let addresses: [Address]
    let images: [Image]
//    let weatherInfo: String
//    let name: String
//    let designation: String
}

struct Activity: Decodable {
    let id: String
    let name: String
}

struct Topic: Decodable {
    let id: String
    let name: String
}

struct Contacts: Decodable {
    let phoneNumbers: [PhoneNumber]
    let emailAddresses: [EmailAddress]
}

struct PhoneNumber: Decodable {
    let phoneNumber: String
    let description: String
    let `extension`: String
    let type: String
}

struct EmailAddress: Decodable {
    let description: String
    let emailAddress: String
}

struct EntranceFee: Decodable {
    let cost: String
    let description: String
    let title: String
}

struct EntrancePass: Decodable {
    let cost: String
    let description: String
    let title: String
}

struct Fee: Decodable {
    
}

struct Hours: Decodable {
    let exceptions: [Exception]
    let description: String
    let standardHours: StandardHours
    let name: String
}

struct Exception: Decodable {
    let exceptionHours: ExceptionHours
    let startDate: String
    let name: String
    let endDate: String
}

struct ExceptionHours: Decodable {
    let wednesday: String
    let monday: String
    let thursday: String
    let sunday: String
    let tuesday: String
    let friday: String
    let saturday: String
}

struct StandardHours: Decodable {
    let wednesday: String
    let monday: String
    let thursday: String
    let sunday: String
    let tuesday: String
    let friday: String
    let saturday: String
}

struct Address: Decodable {
    let postalCode: String
    let city: String
    let stateCode: String
    let line1: String
    let type: String
    let line3: String
    let line2: String
}

struct Image: Decodable {
    let credit: String
    let title: String
    let altText: String
    let caption: String
    let url: String
}
