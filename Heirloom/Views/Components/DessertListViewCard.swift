//
//  DessertListViewCard.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/11/24.
//

import SwiftUI

struct DessertListViewCard: View {
    let dessert: Dessert
    
    var body: some View {
        NavigationLink(destination: DessertDetailsView(dessertID: dessert.id)) {
            HStack(spacing: 16) {
                AsyncImage(url: dessert.thumbnail) { image in
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                    
                } placeholder: {
                    ZStack {
                        Rectangle()
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                            .foregroundStyle(.thinMaterial)
                        
                        ProgressView()
                            .padding(.horizontal, 8)
                    }
                }
                
                Text(dessert.name)
                    .font(.headline)
                    .bold()
            }
        }
    }
}

#Preview {
    DessertListViewCard(dessert: PreviewData_Dessert.apamBalik)
}
