//
//  ClientList.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI

struct ClientList: View {
    @Binding var worker: Technician
    @State var newCus = Khach.ThemKhach()
    @State private var trangMoi = false
    @State private var text = ""
    @State private var listTim: [Khach] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(text == "" ? worker.khach: listTim) { khach in
                    NavigationLink(destination: ClientDetail(worker: $worker, khach: binding(for: khach))){
                        KhachRow(khach: khach)
                    }
                }.onDelete{ khach in
                    withAnimation{
                        worker.khach.remove(atOffsets: khach)
                    }
                }
                
            }//list
            .searchable(text: $text, placement: .automatic, prompt: "Find Name")
            .onChange(of: text){name in
                listTim = worker.khach.filter {$0.name.contains(name)}
            }
           
            .navigationBarItems(trailing: Button(action: {trangMoi = true },
                                                 label: {Image(systemName: "plus")}))
            .sheet(isPresented: $trangMoi) {
                NavigationView {
                    ClientEdit(worker: $worker, client: $newCus)
                        .navigationBarItems(leading: Button("Cancel"){
                            trangMoi = false
                        }, trailing: Button("Add"){
                            let newClient = Khach(name: newCus.name, sdt: newCus.sdt, desc: newCus.desc ,dvDone: newCus.dvDone)
                            worker.khach.insert(newClient, at: 0)
                            trangMoi = false
                        })
                        .onAppear{
                            newCus.name.removeAll()
                            newCus.sdt.removeAll()
                            newCus.desc.removeAll()
                        }
                }
        }
        }
        
    }//body
    private func binding(for khachIndex: Khach) -> Binding<Khach> {
        guard let clientIndex = worker.khach.firstIndex(where: {$0.id == khachIndex.id}) else {fatalError("khong the lay khach index")}
        return $worker.khach[clientIndex]
    }
}

struct ClientList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClientList(worker: .constant(quang))
        }
    }
}
