//
//  XapSep.swift
//  DayEarn
//
//  Created by Thong Vu on 11/24/22.
//

import SwiftUI

struct XapSep: View {
    @Binding var worker: Technician
    @State private var khong: Bool = false
    @State private var resetWarning = false
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Total:")
                    Spacer()
                    Text("\(worker.tinhTheoNgay())")
                        .foregroundColor(worker.tinhTheoNgay() > 2000 ? .purple : .primary)
                }
                Section(header: Text("Today")){
                    HStack {
                        Label("\(worker.tongNgay())", systemImage: "dollarsign")
                            .foregroundColor(worker.tongNgay() == 0 ? .gray : .green)
                        Spacer()
                        Button(action: {
                            let newWeek = WeekEarn(tuan: "\(Date.now.formatted(.dateTime.month().day().weekday(.wide)))", earn: worker.tongNgay())
                            worker.weekEarn.insert(newWeek, at: 0)
                            khong = true
                        }, label:{Image(systemName: "tray.and.arrow.down")})
                    }.alert("Today have saved", isPresented: $khong, actions: {})
                }
                
                Section(header: Text("DAYS WERE SAVED")){
                    ForEach(worker.weekEarn) { tuan in
                        HStack {
                            Text(tuan.tuan)
                            Spacer()
                            Text("$\(tuan.earn)")
                        }
                    }.onDelete {tuan in
                        worker.weekEarn.remove(atOffsets: tuan)
                    }
                }

            }
            .navigationTitle("Summary!")
            
            .navigationBarItems(leading: Button("Reset"){
                resetWarning = true
            })
            .confirmationDialog("Delete", isPresented: $resetWarning) {
                Button("Erase All Days Saved!", role: .destructive){ worker.weekEarn.removeAll()}
                Button("Cancel", role: .cancel){ resetWarning = false }}
            
        }
    }//body
    private func binding(for khachIndex: Khach) -> Binding<Khach> {
        guard let clientIndex = worker.khach.firstIndex(where: {$0.id == khachIndex.id}) else {fatalError("khong the lay khach index")}
        return $worker.khach[clientIndex]
    }
    
}

struct XapSep_Previews: PreviewProvider {
    static var previews: some View {
        XapSep(worker: .constant(quang))
    }
}

