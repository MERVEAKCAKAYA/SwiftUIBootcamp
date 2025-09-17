//
//  Note.swift
//  Odev_7
//
//  Created by Merve Akçakaya on 11.09.2025.
//
import Foundation
struct Note: Codable, Identifiable, Hashable{
    var id: UUID = UUID()
    var title: String
    var content: String
    var date: Date
}

