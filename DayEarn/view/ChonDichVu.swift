//
//  ChonDichVu.swift
//  DayEarn
//
//  Created by Thong Vu on 11/24/22.
//

import SwiftUI

struct ChonDichVu: View {
    @EnvironmentObject var worker: KhachData
    @Binding var client: Khach.ThemKhach
    var cotGrid: [GridItem] = [GridItem(spacing:5, alignment: .center),
                               GridItem(spacing:5, alignment: .center),
                               GridItem(spacing:5, alignment: .center)]
    
    var dichvu: [String] {
        var ds: [String] = []
        for ser in client.dvDone {
            ds.append(ser.dichVu)
        }
        return ds
    }
    var danhmuc: String {
        ListFormatter.localizedString(byJoining: dichvu)
    }
    
    var body: some View {
        VStack {
            Text("Picked: \(danhmuc)")
            LazyVGrid (columns: cotGrid,alignment: .center, spacing: 5, content: {
                ForEach(worker.worker.services){ serv in
                    Button(action: {
                        client.dvDone.append(serv)
                    }, label: {
                        VStack {
                        Text(serv.dichVu)
                        Text("$\(serv.gia)")
                        }.padding()
                                
                    })
                }
            })
        }
    }
}

struct ChonDichVu_Previews: PreviewProvider {
    static var previews: some View {
        ChonDichVu(client: .constant(khachmau[0].mau))
            .environmentObject(KhachData())
    }
}
