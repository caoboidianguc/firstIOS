//
//  ServiceView.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI

struct ServiceView: View {
    @Binding var worker: Technician
    @State private var themdv = Service.themDv()
    @State private var nutThem = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(worker.services) { dv in
                    HStack {
                        Text(dv.dichVu)
                        Spacer()
                        Text("$\(dv.gia)")
                    }.padding(.bottom)
                }
                .onDelete {xoa in
                    worker.services.remove(atOffsets: xoa)
                }
                .navigationTitle("Services")
                HStack {
                    NewService(newSer: $themdv)
                    Button("Add", action: {
                        let newSer = Service(dichVu: themdv.dichVu, gia: themdv.gia)
                        worker.services.append(newSer)
                    }).disabled(themdv.dichVu.isEmpty)
                }
            }//list
            
            .listStyle(.plain)
        }
        
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView(worker: .constant(quang))
    }
}
