//
//  ContentView.swift
//  MultipeerPoc2
//
//  Created by Lucas Dantas de Moura Carvalho on 17/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var colorSession = ColorMultipeerSession()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Connected Devices:")
            Text(String(describing: colorSession.connectedPeers.map(\.displayName)))

            Divider()

            HStack {
                ForEach(NamedColor.allCases, id: \.self) { color in
                    Button(color.rawValue) {
                        colorSession.send(color: color)
                    }
                    .padding()
                }
            }
            Spacer()
        }
        .padding()
        .background((colorSession.currentColor.map(\.color) ?? .clear).ignoresSafeArea())
    }
}

extension NamedColor {
    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .yellow:
            return .yellow
        }
    }
}

#Preview {
    ContentView()
}
