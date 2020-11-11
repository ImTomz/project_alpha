//
//  AlbumsView.swift
//  project_alpha
//
//  Created by Tomas Boda on 15/10/2020.
//

import SwiftUI
import Photos

struct AlbumsView: View {
    @State private var isAddMenuPresented = false
    @State var imageArray = [UIImage]()
    public var childName: String
    var screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color.init("BackgroundColor")
                .navigationBarTitle(Text(self.childName),displayMode: .inline)
                .navigationBarItems(trailing: AlbumsTrailingButton(isAddMenuPresented: $isAddMenuPresented))
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.flexible(minimum: screenWidth/3, maximum: screenWidth/3),spacing: 1),
                                    GridItem(.flexible(minimum: screenWidth/3, maximum: screenWidth/3),spacing: 1),
                                    GridItem(.flexible(minimum: screenWidth/3, maximum: screenWidth/3))],spacing: 1
                            , content: {
                                ForEach(imageArray, id: \.self){ num in
                                    Image(uiImage: num)
                            .resizable()
                            .scaledToFill()
                            .frame(width: screenWidth/3,
                                   height: screenWidth/3,
                                   alignment: .center)
                            .clipped()
                            .background(Color.init(.gray))
                    }
                    
                })
                
            }
        }.onAppear(perform: makePhotosRequest )
    }
    
    func makePhotosRequest() {
        DispatchQueue.main.async {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    self.grabPhotosFromLib()
                default:
                    print("cant do that")
                }
            }
        }
    }
    
    func grabPhotosFromLib() {
        let imgManager = PHImageManager.default()
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        if let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions) {
            if fetchResult.count > 0 {
                for i in 0..<fetchResult.count {
                    imgManager.requestImage(for: fetchResult.object(at: i) as PHAsset, targetSize: CGSize(width: 200, height: 200) , contentMode: .aspectFill, options: requestOptions ,resultHandler: {
                        image,error in
                        if image != nil {
                            self.imageArray.append(image!)
                        }
                        
                    })
                }
            }
            else {
                print("u got no photos")
            }
        }
    }
}

// MARK: -Navigation trailing button view
struct AlbumsTrailingButton: View {
    
    @Binding var isAddMenuPresented: Bool
    
    var body: some View {
        Button(action: {self.isAddMenuPresented.toggle()}) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 25, height: 25, alignment: .center)
                .accentColor(.gray).padding(.trailing, 20)
        }//.sheet(isPresented: $isAddMenuPresented, content: {MainView()})
    }
}

// MARK: -Preview
//struct AlbumsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumsView(childName: "")
//    }
//}
