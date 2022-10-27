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
    
    var body: some View {
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
        }
        .listStyle(.plain)
        
        
        
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView {
            ServiceView(worker: .constant(quang))
        //}
    }
}
