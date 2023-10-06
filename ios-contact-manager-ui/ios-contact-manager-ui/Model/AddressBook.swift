//
//  contacts.swift
//  ios-contact-manager-ui
//
//  Created by JaeHyeok Sim on 2023/10/05.
//

import Foundation

class AddressBook {
    private var contacts: [[Contact]] = Array(repeating: [], count: 26)
    
    func getFirstLetterIndex(_ name: String) -> Int {
        let firstLetter = Array(name)[0].uppercased()
        let index = firstLetter.unicodeScalars.map { Int($0.value)}[0]
        return Int(index - 65)
    }
    
    func addContact(_ newContact: Contact) {
        let index = getFirstLetterIndex(newContact.name)
        contacts[index].append(newContact)
        contacts[index].sort(by: {$0.name < $1.name})
    }
    
    func deleteContact(_ section: Int, _ row: Int) {
        contacts[section].remove(at: row)
    }
    
    func changeContact(_ section: Int, _ row: Int, _ changedContact: Contact) {
        contacts[section][row] = changedContact
    }
    
    func showContact(_ section: Int, _ row: Int) -> Contact {
        return contacts[section][row]
    }
    
    func getSectionSize() -> Int {
//        var size = 0
//        for contact in contacts {
//            size += contact.count == 0 ? 0 : 1
//        }
//        return size
        return contacts.count
    }
    
    func getRowSize(_ section: Int) -> Int {
        return contacts[section].count
    }
}