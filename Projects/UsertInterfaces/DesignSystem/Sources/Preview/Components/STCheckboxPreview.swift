import SwiftUI

struct STCheckboxPreview: View {
    @State var onIsOn = true
    @State var offIsOn = false
    var body: some View {
        ZStack {
            Color.extraBackground
                .edgesIgnoringSafeArea(.all)
            HStack(spacing: 15) {
                STCheckbox(isOn: $onIsOn)
                STCheckbox(isOn: $offIsOn)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct STCheckboxPreview_Previews: PreviewProvider {
    static var previews: some View {
        STCheckboxPreview()
    }
}
