//
//  Khach.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import Foundation



struct Khach: Codable, Identifiable, Equatable {
    static func == (lhs: Khach, rhs: Khach) -> Bool {
        if lhs.name == rhs.name && lhs.sdt == rhs.sdt {
            return true
        }
        return false
    }
    
    var id: UUID
    var name: String
    var sdt: String
    var desc: String
    var diem: Int = 1
    var dvDone: [Service] = []
    var services: [Service]
    var ngay: Date
    
    init(id: UUID = UUID(),name: String, sdt: String, desc: String = "", dvDone: [Service] = [], services: [Service] = dvmau, ngay: Date = Date()){
        self.id = id
        self.name = name
        self.sdt = sdt
        self.desc = desc
        self.dvDone = dvDone
        self.services = services
        self.ngay = ngay
    }
    
    func khachTra() -> Int {
        var tongChi = 0
        for dvu in self.dvDone {
            tongChi += dvu.gia
        }
        return tongChi
    }
    var schedule: Bool {
        ngay > Date.now
    }
    var haiNgay: Bool {
        schedule && ngay < Date.now.quaNgay
    }
    var overTuan: Bool {
        schedule && !haiNgay && ngay < Date.now.qua7Ngay
    }
    var xahon: Bool {
        ngay >= Date().qua7Ngay
    }
    var today: Bool {
        ngay.formatted(date: .numeric, time: .omitted) == Date().formatted(date: .numeric, time: .omitted)
    }
    var honTuan: Bool {
        ngay.qua7Ngay < Date.now
    }
    
    var trongTuan: Bool {
        !honTuan && !schedule
    }
    
}

let khachmau = [Khach(name: "hibi", sdt: "7642",dvDone:[Service(dichVu: "Full", gia: 50)]),
                Khach(name: "Jubi", sdt: "8775", dvDone:[Service(dichVu: "talk", gia: 60)], ngay: Date.from(year: 2022, month: 11, day:21)),
                Khach(name: "Linh", sdt: "8775", dvDone:[Service(dichVu: "read", gia: 70)], ngay: Date.from(year: 2022, month: 8, day:17)),
                Khach(name: "Quang", sdt: "9070", dvDone:[Service(dichVu: "gaming", gia: 40)], ngay: Date.from(year: 2022, month: 11, day:3))]

extension Khach {
    struct ThemKhach {
        var name: String = ""
        var sdt: String = ""
        var desc: String = ""
        var dvDone: [Service] = []
        var services: [Service] = dvmau
        var diem: Int = 1
        var ngay: Date = Date()
    }
    //mau: ThemKhach la de khi update custommer, load this
    var mau: ThemKhach {
        return ThemKhach(name: name, sdt: sdt, desc: desc, dvDone: dvDone, services: services, diem: diem, ngay: ngay)
        
    }
    
    static var dvmau = [Service(dichVu: "Full set", gia: 60),
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
    
    mutating func update(tu data: ThemKhach){
        name = data.name
        sdt = data.sdt
        desc = data.desc
        dvDone = data.dvDone
        services = data.services
        diem = data.diem
        ngay = Date()
    }
    mutating func updateDiem(tu data: ThemKhach){
        name = data.name
        sdt = data.sdt
        desc = data.desc
        dvDone = data.dvDone
        services = data.services
        diem = data.diem + 1
        ngay = Date()
    }
    
  
}


extension Date {
    var quaNgay: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 2, to: self) ?? self
    }
    var qua7Ngay: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    static func from(year: Int, month: Int, day: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        var dateCompo = DateComponents()
        dateCompo.year = year
        dateCompo.month = month
        dateCompo.day = day
        let date = gregorianCalendar.date(from: dateCompo)!
        return date
    }
}
