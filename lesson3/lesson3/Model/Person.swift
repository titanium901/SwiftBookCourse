//
//  Person.swift
//  lesson3
//
//  Created by Yury Popov on 08/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation

struct Person {
    var name: String = ""
    var lastName: String = ""
    var emogi: String = ""
    var fullName: String {
        return "\(name) \(lastName)"
    }
    var email: String = ""
    var phoneNumber: String = ""
    
}

func createRandomPersons(names: [String], lastNames: [String], emogis: [String], emails: [String], numbers: [String] ) -> [Person] {
    var personsArray = [Person]()
    
    var namesArray = names.shuffled().makeIterator()
    var lastNameArray = lastNames.shuffled().makeIterator()
    var emogi = emogis.shuffled().makeIterator()
    var email = emails.shuffled().makeIterator()
    var number = numbers.shuffled().makeIterator()
    
    while let el1 = namesArray.next(), let el2 = lastNameArray.next(), let el3 = emogi.next(), let el4 = email.next(), let el5 = number.next()  {
        let newPerson = Person(name: el1, lastName: el2, emogi: el3, email: el4, phoneNumber: el5)
        personsArray.append(newPerson)
    }
    
    return personsArray
    
}


