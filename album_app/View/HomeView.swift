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
    
    @ObservedObject var viewModel = ChildsTableViewModel()
    @ObservedObject var parentViewModel = ParentShowViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.init("BackgroundColor")
                    .ignoresSafeArea(.all)
                    .navigationBarItems(leading: HomeLeadingButton(isSettingsPresented: $isSettingsPresented,model: parentViewModel),
                                        trailing: HomeTrailingButton(isAddMenuPresented: $isAddMenuPresented,model: viewModel))
                    
                VStack {
                    VStack {
                        Image(uiImage: UIImage(data: parentViewModel.parent[0].image)!)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .background(Color.init(.white))
                                .clipShape(Circle())
                                .scaledToFit()                        
                        
                        Text("\(parentViewModel.parent[0].name)")
                            .font(.custom("Bradley Hand Bold", size: 38))
                        Text("Parent")
                    }
                    .frame(width: 400, height: 120, alignment: .center)
                    .padding(.bottom,40)
                                        
                    Spacer().frame(height: 10)
                    
                    ScrollView {
                        
                        LazyVStack {
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
                                )}.accentColor(Color.init(.black))

                        }.padding([.top,.bottom], 20)
                    }
                    
                }
                
            }
        }
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
        }.fullScreenCover(isPresented: $isAddMenuPresented,onDismiss: {
            model.fetchAll()
        }){AddButtonView(showView: $isAddMenuPresented)}
    }
}

// MARK: -Navigation leading button
struct HomeLeadingButton: View {
    @Binding var isSettingsPresented: Bool
    var model: ParentShowViewModel
    
    var body: some View {
        Button(action: {self.isSettingsPresented.toggle()}) {
            Image(systemName: "gear")
                .resizable()
                .frame(width: 35, height: 35, alignment: .center)
                .accentColor(.gray)
                .padding(.leading, 20)
        }.fullScreenCover(isPresented: $isSettingsPresented,onDismiss: {
                    model.fetchAll()
        }){SettingsView(showView: $isSettingsPresented)}
    }
}

// MARK: -Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
