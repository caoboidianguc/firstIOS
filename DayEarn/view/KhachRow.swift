//
//  KhachRow.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI

struct KhachRow: View {
    var khach: Khach
    let ngay = Date()
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(khach.name)
                Spacer()
                Text("$\(khach.khachTra())")
            }
                .foregroundColor(hnay() ? .green : .gray)
            
            Text(khach.ngay, style: .date)
                .font(.footnote)
                .foregroundColor(.secondary)
        }.padding(6)
           
    }
    func hnay() -> Bool {
        if (khach.ngay.formatted(date: .complete, time: .omitted) == ngay.formatted(date: .complete, time: .omitted)) {
            return true
        }
        return false
    }
   
}

struct KhachRow_Previews: PreviewProvider {
    static var previews: some View {
        KhachRow(khach: khachmau[0]).previewLayout(.fixed(width: 300, height: 50))
    }
}
