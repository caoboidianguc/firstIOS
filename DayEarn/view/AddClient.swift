//
//  AddClient.swift
//  DayEarn
//
//  Created by Thong Vu on 11/24/22.
//

import SwiftUI

struct AddClient: View {
    @Binding var worker: Technician
    @Binding var client: Khach.ThemKhach
    @State var newSer = Service.themDv()

    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Name:", text: $client.name).textInputAutocapitalization(.words)
                TextField("Phone Option", text: $client.sdt).keyboardType(.numberPad)
                TextField("Note:", text: $client.desc)
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

struct AddClient_Previews: PreviewProvider {
    static var previews: some View {
        AddClient(worker: .constant(quang),client: .constant(khachmau[0].mau))
            .environmentObject(KhachData())
    }
}
