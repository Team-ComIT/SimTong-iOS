import SwiftUI
// swiftlint:disable identifier_name cyclomatic_complexity
public struct STTypography: ViewModifier {
    public enum Style {
        // MARK: - Regular
        case r1, r2, r3, r4, r5, r6, r7

        // MARK: - Medium
        case m1, m2, m3, m4, m5, m6, m7

        // MARK: - Semibold
        case s1, s2, s3, s4, s5, s6, s7
    }
    var style: Style

    public func body(content: Content) -> some View {
        switch style {
        case .r1: return content
                .font(.system(size: 32, weight: .regular))
        case .r2: return content
                .font(.system(size: 28, weight: .regular))
        case .r3: return content
                .font(.system(size: 24, weight: .regular))
        case .r4: return content
                .font(.system(size: 20, weight: .regular))
        case .r5: return content
                .font(.system(size: 16, weight: .regular))
        case .r6: return content
                .font(.system(size: 14, weight: .regular))
        case .r7: return content
                .font(.system(size: 12, weight: .regular))

        case .m1: return content
                .font(.system(size: 32, weight: .medium))
        case .m2: return content
                .font(.system(size: 28, weight: .medium))
        case .m3: return content
                .font(.system(size: 24, weight: .medium))
        case .m4: return content
                .font(.system(size: 20, weight: .medium))
        case .m5: return content
                .font(.system(size: 16, weight: .medium))
        case .m6: return content
                .font(.system(size: 14, weight: .medium))
        case .m7: return content
                .font(.system(size: 12, weight: .medium))

        case .s1: return content
                .font(.system(size: 32, weight: .semibold))
        case .s2: return content
                .font(.system(size: 28, weight: .semibold))
        case .s3: return content
                .font(.system(size: 24, weight: .semibold))
        case .s4: return content
                .font(.system(size: 20, weight: .semibold))
        case .s5: return content
                .font(.system(size: 16, weight: .semibold))
        case .s6: return content
                .font(.system(size: 14, weight: .semibold))
        case .s7: return content
                .font(.system(size: 12, weight: .semibold))
        }
    }
}

public extension View {
    func stTypo(_ style: STTypography.Style) -> some View {
        self
            .modifier(STTypography(style: style))
    }
    func stTypo(_ style: STTypography.Style, color: Color) -> some View {
        self
            .modifier(STTypography(style: style))
            .foregroundColor(color)
    }
}

public struct Typography_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 10) {
            let regulars: [STTypography.Style] = [.r1, .r2, .r3, .r4, .r5, .r6, .r7]
            Group {
                ForEach(regulars, id: \.self) { style in
                    Text("Regular")
                        .stTypo(style)
                }
            }
            let mediums: [STTypography.Style] = [.m1, .m2, .m3, .m4, .m5, .m6, .m7]
            Group {
                ForEach(mediums, id: \.self) { style in
                    Text("Medium")
                        .stTypo(style)
                }
            }
            let semis: [STTypography.Style] = [.s1, .s2, .s3, .s4, .s5, .s6, .s7]
            Group {
                ForEach(semis, id: \.self) { style in
                    Text("Semibold")
                        .stTypo(style)
                }
            }
            Text("Regular Color")
                .stTypo(.r1, color: .extraPrimary)
            Text("Medium Color")
                .stTypo(.r1, color: .extraCheck)
            Text("Semibold Color")
                .stTypo(.r1, color: .extraError)
        }
    }
}
