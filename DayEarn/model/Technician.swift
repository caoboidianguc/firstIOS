//
//  Technician.swift
//  DayEarn
//
//  Created by Thong Vu on 11/24/22.
//

import Foundation


struct Technician: Codable {
    let name: String
    var services: [Service]
    var khach: [Khach]
    var weekEarn: [WeekEarn] = []
    init(name: String, services:[Service] = dvTech , khach:[Khach] = []){
        self.name = name
        self.services = services
        self.khach = khach
    }
}
let quang = Technician(name: "Quang", khach: khachmau)

extension Technician {
    static var dvTech: [Service] = [Service(dichVu: "Full set", gia: 60),
                                    Service(dichVu: "Hair cut", gia: 35)]
    
    
     mutating func delete(_ client: Khach){
        self.khach.removeAll(where: {$0.id == client.id })
    }
    
    func clientExisted(_ client: Khach) -> Bool {
        self.khach.contains(client)
    }
    
    func tongNgay() -> Int {
        var tong = 0
        for lan in khach {
            if lan.today {
                tong += lan.khachTra()
            }
        }
        return tong
    }
    
    func tinhTheoNgay() -> Int {
        var tong = 0
        for ngay in weekEarn {
            tong += ngay.earn
        }
        return tong
    }
    
    func tuan(quaTuan: QuaTuan) -> [Khach] {
        self.khach.filter {
            switch quaTuan {
            case .tuan:
                return $0.haiNgay
            case .nuaThang:
                return $0.overTuan
            case .xaxoi:
                return $0.xahon
            }
        }.sorted(by: {$0.ngay < $1.ngay})
        
    }
    
    func listDaTim(ten: String) -> [Khach] {
        self.khach.filter { $0.name.contains(ten)}
    }
}

enum QuaTuan: String, CaseIterable, Identifiable {
    case tuan = "Comming up"
    case nuaThang = "Within 7 days"
    case xaxoi = "Over week"
    
    var id: String {self.rawValue}
    var name: String {self.rawValue}
}
