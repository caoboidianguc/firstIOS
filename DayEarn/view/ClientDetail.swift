//
//  ClientDetail.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI


struct ClientDetail: View {
    @Binding var worker: Technician
    @Binding var khach: Khach
    @State private var updateKhach: Khach.ThemKhach = Khach.ThemKhach()
    @State private var suadoi = false
    @State private var xoa = false
    
    var body: some View {
        List {
            Section(header: Text("Client:")) {
                HStack {
                    Text(khach.name)
                    Spacer()
                    Text(khach.sdt)
                }
            }.padding(8)
            Section(header: Text("Service:")) {
                ForEach(khach.dvDone){dv in
                    HStack {
                        Text(dv.dichVu)
                        Spacer()
                        Text("$\(dv.gia)")
                    }
                }
            }
           
            Section(header: Text("Detail")){
                Text("Last Done: \(khach.ngay.formatted(.dateTime))")
                Text("Note: \(khach.desc)")
                Text("Time visited: \(khach.diem)")
                Text("Total: $\(khach.khachTra())")
            }
            
            Button("Delete This Client"){
                xoa = true
            }.foregroundColor(.red)
                .confirmationDialog("You can't undo this!", isPresented: $xoa, actions: {
                    Button{worker.delete(khach)} label: {
                        Text("Delete")
                    }
                    Button("Cancel", role: .cancel) { xoa = false}
                })
            
        }.navigationTitle(Text("\(khach.name) visited"))
            .navigationBarItems(trailing: Button("Edit"){
                suadoi = true
                updateKhach = khach.mau
            })
            .fullScreenCover(isPresented: $suadoi) {
                NavigationView {
                    ClientEdit(worker: $worker, client: $updateKhach)
                        .navigationBarItems(leading: Button("Huy"){
                            suadoi = false
                        }, trailing: Button("Update"){
                            if khach.dvDone.isEmpty {
                                khach.update(tu: updateKhach)
                            } else {
                                khach.updateDiem(tu: updateKhach)
                            }
                            
                            suadoi = false
                        })
                }
            }
    }//body
    
}

struct ClientDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClientDetail(worker: .constant(quang),khach: .constant(khachmau[0]))
        }
    }
}
