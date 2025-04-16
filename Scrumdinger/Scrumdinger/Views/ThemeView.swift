//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Abhishek G on 16/04/25.
//

import SwiftUI
import ThemeKit

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .foregroundColor(.accentColor)
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
