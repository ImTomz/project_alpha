//
//  SettingsView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showView: Bool
    
    @State private var parentName: String = ""
    @State var image: Image?
    @State var imagePickerPresented = false
    @State var inputImage: UIImage?
    
    @ObservedObject var parentViewModel = ParentShowViewModel()
    
    var body: some View {
        VStack {
            
            Text("Settings").font(.title)
            if image != nil {
                image?.resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .background(Color.init(.white))
                    .clipShape(Circle())
                    .clipped()
                    .onTapGesture {
                        self.imagePickerPresented = true
                    }
            }else {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.init(.white))
                    .clipShape(Circle())
                    .scaledToFit()
                    .onTapGesture {
                        self.imagePickerPresented = true
                    }
            }
            
            TextField("\(parentViewModel.parent[0].name)", text: self.$parentName)
                .background(Color.init("BackgroundColor"))
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Button(action: {
                    
                    if inputImage != nil {
                        parentViewModel.editParent(parent: ParentViewModel(name: self.parentName,image: (self.inputImage)!.jpegData(compressionQuality: 0.9)!))
                        self.showView = false
                    }
                    parentViewModel.editParent(parent: ParentViewModel(name: self.parentName,image: parentViewModel.parent[0].image))
                    self.showView = false
                    
                    
                }, label: {
                    Text("Save")
                })
                Button {
                    self.showView = false
                } label: {
                    Text("Cancel")
                }

            }
           
        }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }.onAppear(
            perform: {
                parentViewModel.fetchAll()
                let uiImage = UIImage(data: parentViewModel.parent[0].image)!
                image = Image(uiImage: uiImage)
                parentName = parentViewModel.parent[0].name
            }
        )
       
    }
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
