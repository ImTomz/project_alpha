//
//  HomeView.swift
//  project_alpha
//
//  Created by Tomas Boda on 14/10/2020.
//

import SwiftUI

struct HomeView: View {
    @State var isSettingsPresented = false
    @State var isAddMenuPresented = false
    @State var image: Image?
    @State var imagePickerPresented = false
    @State var inputImage: UIImage?
    
    @ObservedObject var viewModel = ChildsTableViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.init("BackgroundColor")
                    .ignoresSafeArea(.all)
                    .navigationBarItems(leading: HomeLeadingButton(isSettingsPresented: $isSettingsPresented),
                                        trailing: HomeTrailingButton(isAddMenuPresented: $isAddMenuPresented,model: viewModel))
                    
                VStack {
                    VStack {
                        if image != nil {
                            image?.resizable()
                                .frame(width: 100, height: 100)
                                .background(Color.init(.white))
                                .clipShape(Circle())
                                .scaledToFit()
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
                        
                        Text("Tomas Boda")
                            .font(.custom("Bradley Hand Bold", size: 38))
                        Text("Parent")
                    }
                    .frame(width: 400, height: 120, alignment: .center)
                    .padding(.bottom,40)
                                        
                    Spacer().frame(height: 10)
                    
                        List {
                            ForEach(viewModel.childs){ child in
                                NavigationLink(destination: AlbumsView(childName: child.name)) {
                                    ChildCellView(name: child.name,birthDate: child.birthDate)
                                }
                                Button(action: {
                                    CoreDataManager.shared.removeChild(id: child.id)
                                    viewModel.fetchAll()
                                }, label: {
                                    Text("Delete")
                                }
                                )}


                        }.padding([.top,.bottom], 20)
                        .background(Color.init("BackgroundColor"))
                        
                    
                }
                
            }

        }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

// MARK: -Navigation trailing button
struct HomeTrailingButton: View {
    @Binding var isAddMenuPresented: Bool
    var model: ChildsTableViewModel
    
    var body: some View {
        Button(action: {
            self.isAddMenuPresented.toggle()
        }) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 25, height: 25, alignment: .center)
                .accentColor(.gray)
                .padding(.trailing, 20)
        }.sheet(isPresented: $isAddMenuPresented,onDismiss: {
            model.fetchAll()
        }){AddButtonView()}
    }
}

// MARK: -Navigation leading button
struct HomeLeadingButton: View {
    @Binding var isSettingsPresented: Bool
    
    var body: some View {
        Button(action: {self.isSettingsPresented.toggle()}) {
            Image(systemName: "gear")
                .resizable()
                .frame(width: 35, height: 35, alignment: .center)
                .accentColor(.gray)
                .padding(.leading, 20)
        }.sheet(isPresented: $isSettingsPresented){SettingsView()}
    }
}

// MARK: -Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
