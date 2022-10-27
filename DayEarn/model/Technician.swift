//
//  Technician.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import Foundation



struct Technician: Codable {
    let name: String
    var services: [Service]
    var khach: [Khach]
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
                                    Service(dichVu: "Nail-Shape", gia: 10)]}
