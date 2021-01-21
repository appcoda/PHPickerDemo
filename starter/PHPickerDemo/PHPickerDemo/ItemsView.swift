//
//  ItemsView.swift
//  PHPickerDemo
//
//  Created by Gabriel Theodoropoulos.
//

import SwiftUI

struct ItemsView: View {
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            EmptyView()
                .navigationBarItems(leading: Button(action: {
                    
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
            
        })
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
