//
//  AddButtonView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct AddButtonView: View {
    
    @Binding var showView: Bool
    
    @State private var newChildName = ""
    @State private var birthDate = Date()
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var imagePickerPresented = false
    
    
    var body: some View {
        VStack{
            if image != nil {
                image?.resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.init(.white))
                    .scaledToFit()
                    .onTapGesture {
                        self.imagePickerPresented = true
                    }
            }else {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.init(.white))
                    .scaledToFit()
                    .onTapGesture {
                        self.imagePickerPresented = true
                    }
            }
            HStack {
                TextField("New child name", text: self.$newChildName)
                    .background(Color.init("BackgroundColor"))
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                DatePicker(selection: $birthDate, displayedComponents: .date) {
                    Text("Select a date")
                }.labelsHidden()
                .accentColor(.gray)
            }
            HStack {
                Button(action: {
                    if inputImage != nil,newChildName != "" {
                        let vm = AddChildViewModel()
                        vm.addChild(childVM: ChildViewModel(id: UUID(), name: self.newChildName, birthDate: self.birthDate,image: (inputImage?.pngData() ?? UIImage(systemName: "person")?.pngData())!))
                        self.showView = false
                    }
                    
                   
                    
                    
                }, label: {
                    Text("Add")
                })
                Button {
                    self.showView = false
                } label: {
                    Text("Cancel")
                }

            }
            
            Spacer()
        }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        
        
        
    }
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
    
}

//struct AddButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddButtonView()
//    }
//}
