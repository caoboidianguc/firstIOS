//
//  KhachRow.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI

struct KhachRow: View {
    var khach: Khach
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(khach.name)
                Spacer()
                Text(khach.sdt)
            }
            .foregroundColor(khach.today ? .green : .gray)
            
            Text(khach.ngay, style: .date)
                .font(khach.schedule ? .title3 : .footnote)
                .foregroundColor(khach.schedule ? .purple : .secondary)
        }.padding(6)
           
    }
   
}

struct KhachRow_Previews: PreviewProvider {
    static var previews: some View {
        KhachRow(khach: khachmau[0]).previewLayout(.fixed(width: 300, height: 50))
    }
}
