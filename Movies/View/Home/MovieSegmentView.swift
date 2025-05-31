//
//  MovieSegmentView.swift
//  Movies
//
//  Created by Mahmoud Fouad on 31/05/2025.
//

import SwiftUI

struct MovieSegmentView: View {
    @Binding var selectedType: MovieType
    var body: some View {
        HStack {
            Spacer()
            Picker("", selection: $selectedType) {
                ForEach(MovieType.allCases, id: \.self) {
                    Text($0.text)
                        .font(.body)
                        .foregroundStyle(.black)
                }
            }
            .tint(.white)
            .pickerStyle(.menu)
            
        }
    }
}

enum MovieType: CaseIterable {
    case all
    case action
    case animation
    case comedey
    case drama
    case family
    case favorite
    
    var text: String {
        switch self {
        case .action:
            return "Action"
        case .animation:
            return "Animation"
        case .comedey:
            return "Comedey"
        case .drama:
            return "Drama"
        case .family:
            return "Family"
        case .favorite:
            return "My Favorite"
        default:
            return "All"
        }
    }
    
    var id: Int {
        switch self {
        case .action:
            return 28
        case .animation:
            return 16
        case .comedey:
            return 35
        case .drama:
            return 18
        case .family:
            return 10751
        default:
            return 0
        }
    }
}

