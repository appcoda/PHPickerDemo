//
//  ItemsView.swift
//  PHPickerDemo
//
//  Created by Gabriel Theodoropoulos.
//

import SwiftUI
import AVKit

struct ItemsView: View {
    @State private var showSheet = false
    @ObservedObject var mediaItems = PickedMediaItems()
    
    var body: some View {
        NavigationView {
            List(mediaItems.items, id: \.id) { item in
                ZStack(alignment: .topLeading) {
                    if item.mediaType == .photo {
                        Image(uiImage: item.photo ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if item.mediaType == .video {
                        if let url = item.url {
                            VideoPlayer(player: AVPlayer(url: url))
                                .frame(minHeight: 200)
                        } else { EmptyView() }
                    } else {
                        if let livePhoto = item.livePhoto {
                            LivePhotoView(livePhoto: livePhoto)
                                .frame(minHeight: 200)
                        } else { EmptyView() }
                    }
                                        
                    Image(systemName: getMediaImageName(using: item))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .padding(4)
                        .background(Color.black.opacity(0.5))
                        .foregroundColor(.white)
                }
            }
                .navigationBarItems(leading: Button(action: {
                    mediaItems.deleteAll()
                }, label: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }), trailing: Button(action: {
                    showSheet = true
                }, label: {
                    Image(systemName: "plus")
                }))
        }
        .sheet(isPresented: $showSheet, content: {
            PhotoPicker(mediaItems: mediaItems) { didSelectItem in
                // Handle didSelectItems value here...
                showSheet = false
            }
        })
    }
    
    
    fileprivate func getMediaImageName(using item: PhotoPickerModel) -> String {
        switch item.mediaType {
            case .photo: return "photo"
            case .video: return "video"
            case .livePhoto: return "livephoto"
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
