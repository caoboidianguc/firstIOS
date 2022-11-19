//
//  KhachRow.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI

struct KhachRow: View {
    var khach: Khach
    
    var mauChon: [Color] = [
        .green,.purple,.accentColor,.black,.blue,.brown,.cyan,.indigo,.mint,.orange,.pink,.red,.teal,.yellow]
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(.title3)
                
            VStack(alignment: .leading) {
                HStack {
                    Text(khach.name)
                    Spacer()
                    Text(khach.sdt)
                }
                
                Text(khach.ngay, style: .date)
                    .font(khach.schedule ? .title3 : .footnote)
                    .foregroundColor(khach.schedule ? .purple : .secondary)
            }
        }.foregroundColor(khach.today ? mauChon.randomElement() : .gray)
           
    }
   
}

struct KhachRow_Previews: PreviewProvider {
    static var previews: some View {
        KhachRow(khach: khachmau[0]).previewLayout(.fixed(width: 300, height: 50))
            
    }
}
