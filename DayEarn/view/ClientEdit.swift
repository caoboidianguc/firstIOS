//
//  ClientEdit.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//


import SwiftUI

struct ClientEdit: View {
    @Binding var worker: Technician
    @Binding var client: Khach.ThemKhach
    @State var newSer = Service.themDv()
//    var cotGrid: [GridItem] = [GridItem(spacing:5, alignment: .center),
//                               GridItem(spacing:5, alignment: .center),
//                               GridItem(spacing:5, alignment: .center)]
//    var dichvu: [String] {
//        var ds: [String] = []
//        for ser in client.dvDone {
//            ds.append(ser.dichVu)
//        }
//        return ds
//    }
//    var danhmuc: String {
//        ListFormatter.localizedString(byJoining: dichvu)
//    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Name:", text: $client.name)
                TextField("Phone Option", text: $client.sdt)
                TextField("Note:", text: $client.desc)
                //Text(danhmuc)
            }.padding()
            
            ChonDichVu(client: $client)
            HStack {
                NewService(newSer: $newSer)
                Button("Add Service", action: {
                    let new = Service(dichVu: newSer.dichVu, gia: newSer.gia)
                    worker.services.append(new)
                    client.dvDone.append(new)
                }).disabled(newSer.dichVu.isEmpty)
            }
        }//list
        .onAppear{
            client.dvDone.removeAll()
        }
    }//body
    
}

struct ClientEdit_Previews: PreviewProvider {
    static var previews: some View {
        ClientEdit(worker: .constant(quang),client: .constant(khachmau[0].mau))
            .environmentObject(KhachData())
            
    }
}
