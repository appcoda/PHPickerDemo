//
//  LivePhotoView.swift
//  PHPickerDemo
//
//  Created by Gabriel Theodoropoulos.
//

import SwiftUI
import PhotosUI

struct LivePhotoView: UIViewRepresentable {
    typealias UIViewType = PHLivePhotoView
    
    var livePhoto: PHLivePhoto
    
    func makeUIView(context: Context) -> PHLivePhotoView {
        let livePhotoView = PHLivePhotoView()
        livePhotoView.livePhoto = livePhoto
        
        // Enable the following optionally to see live photo
        // playing back when it appears.
        // livePhotoView.startPlayback(with: .hint)
        
        return livePhotoView
    }
    
    func updateUIView(_ uiView: PHLivePhotoView, context: Context) {
        
    }
}
