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
            }//list
            
            .listStyle(.plain)
            .navigationBarItems(leading:
                                    Button("New"){nutThem = true}
            )
            .sheet(isPresented: $nutThem) {
                NavigationView {
                    NewService(newSer: $themdv)
                        .navigationBarItems(leading: Button("Cancel"){
                            nutThem = false
                        }, trailing: Button("Add"){
                            let dv = Service(dichVu: themdv.dichVu, gia: themdv.gia)
                            worker.services.append(dv)
                            nutThem = false
                        })
                }
        }
        }
        
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView(worker: .constant(quang))
    }
}
