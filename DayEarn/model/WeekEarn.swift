//
//  WeekEarn.swift
//  DayEarn
//
//  Created by Thong Vu on 11/24/22.
//

import Foundation


struct WeekEarn: Codable, Identifiable {
    var id: UUID
    var tuan: String
    var earn: Int
    
    init(id: UUID = UUID(), tuan: String, earn: Int) {
        self.id = id
        self.tuan = tuan
        self.earn = earn
    }
    
}
