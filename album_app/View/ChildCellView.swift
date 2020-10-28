//
//  ChildCellView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct ChildCellView: View {
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    
    @State var name = ""
    var birthDate: Date
    var imageData: Data
    
    var body: some View {
        HStack {
            
            VStack {
                Text(self.name).font(.custom("Bradley Hand Bold", size: 45))
                Text("\(self.birthDate,formatter: dateFormatter)")
                Spacer().frame(height:10)
                ZStack {
                    
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .scaledToFit()
                        .background(Color.init("BackgroundColor"))
                    
                }.frame(width: 300, height: 200, alignment: .center)
                .background(Color.init("BackgroundColor"))
                
            }.padding(20)

        }.frame(width: 320, height: 320, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.init(.white))
        .cornerRadius(20)
        .shadow(color: .gray, radius: 9, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
    }
}

//struct ChildCellView_Previews: PreviewProvider {
//    static var previews: some View {
////        ChildCellView()
//    }
//}
