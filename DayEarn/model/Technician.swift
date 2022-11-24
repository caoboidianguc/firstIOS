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
                                    Service(dichVu: "GelPed", gia: 60),
                                    Service(dichVu: "Combo Gel", gia: 105),
                                    Service(dichVu: "Fill in", gia: 50),
                                    Service(dichVu: "Pedicure", gia: 45),
                                    Service(dichVu: "Gel mani", gia: 45),
                                    Service(dichVu: "Gel Add", gia: 15),
                                    Service(dichVu: "Combo Reg", gia: 70),
                                    Service(dichVu: "Nature Retreat", gia: 55),
                                    Service(dichVu: "Brisa Detox", gia: 70),
                                    Service(dichVu: "Ultimate", gia: 90),
                                    Service(dichVu: "Dip", gia: 50),
                                    Service(dichVu: "Ombre", gia: 70),
                                    Service(dichVu: "french", gia: 5),
                                    Service(dichVu: "Nail-Shape", gia: 10)]
    
    
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
    
}

enum QuaTuan: String, CaseIterable, Identifiable {
    case tuan = "Comming up"
    case nuaThang = "Within 7 days"
    case xaxoi = "Over week"
    
    var id: String {self.rawValue}
    var name: String {self.rawValue}
}
