//
//  STRadioButtonPreview.swift
//  DesignSystem
//
//  Created by 최형우 on 2022/08/07.
//  Copyright © 2022 com.ComIT. All rights reserved.
//

import SwiftUI

struct STRadioButtonPreview: View {
    let dummy = [0, 1, 2, 3, 4]
    @State var selectedId = 0
    var body: some View {
        HStack(spacing: 20) {
            ForEach(dummy, id: \.self) { id in
                STRadioButton(isChecked: selectedId == id) {
                    withAnimation {
                        selectedId = id
                    }
                }
            }
        }
    }
}

struct STRadioButtonPreview_Previews: PreviewProvider {
    static var previews: some View {
        STRadioButtonPreview()
    }
}
