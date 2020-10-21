//
//  ContentView.swift
//  project_alpha
//
//  Created by Tomas Boda on 12/10/2020.
//

import SwiftUI

struct MainView: View {
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }

    @State private var birthDate = Date()
    
    var body: some View {
        
        ZStack {
            Color.init("BackgroundColor").ignoresSafeArea()
            
            ScrollView {
                
                DatePickersView(birthDate: $birthDate)
                
                    ZStack {
                        Text("\(birthDate,formatter: dateFormatter)")
                    }.frame(minWidth: UIScreen.main.bounds.width, idealWidth: UIScreen.main.bounds.width, maxWidth: UIScreen.main.bounds.width, minHeight: 400, idealHeight: 500, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.init(.white))
                    .cornerRadius(50)
                    
                
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .edgesIgnoringSafeArea(.bottom)
        }
            
    }

}
// MARK: -Date pickers view
struct DatePickersView: View {
    @Binding var birthDate: Date
    
    var body: some View {
        VStack {
            Text("Mark").font(.custom("Bradley Hand Bold", size: 36))
            
            Spacer().frame(width: UIScreen.main.bounds.width,
                           height: 5,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            DatePicker(selection: $birthDate, displayedComponents: .date) {
                Text("Select a date")
            }.labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
            
            DatePicker(selection: $birthDate, displayedComponents: .date) {
                Text("Select a date")
            }.labelsHidden()
            .accentColor(.gray)
            
            Spacer().frame(width: UIScreen.main.bounds.width,
                           height: 25,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
// MARK: -Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
