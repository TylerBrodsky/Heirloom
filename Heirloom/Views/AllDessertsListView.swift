//
//  AllDessertsListView.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/11/24.
//

import SwiftUI

struct AllDessertsListView: View {
    @StateObject private var viewModel = DessertViewModel()
       
       var body: some View {
           NavigationView {
               ZStack {
                   VStack {
                       if viewModel.isLoading {
                           ProgressView()
                       } else if let errorMessage = viewModel.errorMessage {
                           Text(errorMessage)
                               .foregroundColor(.red)
                       } else {
                           List(viewModel.desserts, id: \.id) { dessert in
                               DessertListViewCard(dessert: dessert)
                           }
                           .refreshable {
                               await viewModel.fetchDesserts()
                           }
                       }
                   }
                   .navigationTitle("Desserts")
                   
                   VStack {
                       Spacer()
                       
                       HStack {
                           Spacer()
                           
                           Button {
                               viewModel.sortAlphabeticalAscending.toggle()
                               Task {
                                   await viewModel.fetchDesserts()
                               }
                           } label: {
                               Image(systemName: "arrow.up.arrow.down")
                                   .foregroundColor(.blue)
                                   .frame(width: 50, height: 50)
                                   .background(.ultraThinMaterial)
                                   .clipShape(Circle())
                                   .shadow(radius: 6)
                           }
                           .padding()
                       }
                   }
               }
           }
           .onAppear {
               Task {
                   await viewModel.fetchDesserts()
               }
           }
       }
}

#Preview {
    AllDessertsListView()
}
