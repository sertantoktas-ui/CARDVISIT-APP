import SwiftUI

/// AXTCOM App Logo — programmatic SVG-style vector mark
/// Shape: stylized "A" + two intersecting arcs suggesting a network/connection node
struct AXTCOMLogo: View {
    var size: CGFloat = 40
    var isDark: Bool = true   // true = colour on light bg, false = white on dark bg

    private var primary: Color   { isDark ? Color(hex: "1565C0") : .white }
    private var accent: Color    { isDark ? Color(hex: "00B0FF") : Color.white.opacity(0.85) }
    private var secondary: Color { isDark ? Color(hex: "1E88E5") : Color.white.opacity(0.65) }

    var body: some View {
        Canvas { ctx, sz in
            let s = sz.width
            let cx = s / 2
            let cy = s / 2

            // ── Outer glow ring ─────────────────────────────────────────────
            let ring = Path(ellipseIn: CGRect(x: s * 0.06, y: s * 0.06,
                                              width: s * 0.88, height: s * 0.88))
            ctx.stroke(ring,
                       with: .linearGradient(
                           Gradient(colors: [primary.opacity(0.25), accent.opacity(0.05)]),
                           startPoint: CGPoint(x: 0, y: 0),
                           endPoint: CGPoint(x: s, y: s)),
                       lineWidth: s * 0.035)

            // ── Background disc ──────────────────────────────────────────────
            let disc = Path(ellipseIn: CGRect(x: s * 0.12, y: s * 0.12,
                                              width: s * 0.76, height: s * 0.76))
            ctx.fill(disc,
                     with: .linearGradient(
                         Gradient(colors: [primary, secondary]),
                         startPoint: CGPoint(x: s * 0.2, y: 0),
                         endPoint: CGPoint(x: s * 0.8, y: s)))

            // ── "A" letterform (bold geometric) ─────────────────────────────
            let thick: CGFloat = s * 0.09
            let top = CGPoint(x: cx, y: s * 0.22)
            let bl  = CGPoint(x: s * 0.26, y: s * 0.78)
            let br  = CGPoint(x: s * 0.74, y: s * 0.78)

            // Left leg
            var leftLeg = Path()
            leftLeg.move(to: top)
            leftLeg.addLine(to: bl)
            ctx.stroke(leftLeg,
                       with: .color(.white.opacity(0.95)),
                       style: StrokeStyle(lineWidth: thick, lineCap: .round))

            // Right leg
            var rightLeg = Path()
            rightLeg.move(to: top)
            rightLeg.addLine(to: br)
            ctx.stroke(rightLeg,
                       with: .color(.white.opacity(0.95)),
                       style: StrokeStyle(lineWidth: thick, lineCap: .round))

            // Crossbar
            let crossY: CGFloat = s * 0.565
            let crossL = CGPoint(x: cx - s * 0.165, y: crossY)
            let crossR = CGPoint(x: cx + s * 0.165, y: crossY)
            var crossBar = Path()
            crossBar.move(to: crossL)
            crossBar.addLine(to: crossR)
            ctx.stroke(crossBar,
                       with: .linearGradient(
                           Gradient(colors: [accent, .white]),
                           startPoint: crossL,
                           endPoint: crossR),
                       style: StrokeStyle(lineWidth: thick * 0.72, lineCap: .round))

            // ── Network arc (top-right, suggests connectivity) ────────────
            let arcRect = CGRect(x: cx - s * 0.08, y: s * 0.14,
                                 width: s * 0.42, height: s * 0.42)
            var arc = Path()
            arc.addArc(center: CGPoint(x: arcRect.midX, y: arcRect.midY),
                       radius: arcRect.width / 2,
                       startAngle: .degrees(-55),
                       endAngle: .degrees(35),
                       clockwise: false)
            ctx.stroke(arc,
                       with: .color(accent.opacity(0.75)),
                       style: StrokeStyle(lineWidth: s * 0.048, lineCap: .round))

            // ── Dot accent on top-right arc ───────────────────────────────
            let dotR: CGFloat = s * 0.068
            let dot = Path(ellipseIn: CGRect(x: cx + s * 0.25, y: s * 0.18,
                                             width: dotR, height: dotR))
            ctx.fill(dot, with: .color(accent))
        }
        .frame(width: size, height: size)
    }
}

// MARK: - App Icon (large square, used in splash / about)
struct AXTCOMAppIcon: View {
    var size: CGFloat = 120

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size * 0.22, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color(hex: "0D47A1"), Color(hex: "1565C0"), Color(hex: "1E88E5")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: size, height: size)
                .shadow(color: Color(hex: "1565C0").opacity(0.45), radius: size * 0.12, y: size * 0.06)

            AXTCOMLogo(size: size * 0.65, isDark: false)
        }
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 32) {
        // App Icon previews at different sizes
        HStack(spacing: 20) {
            AXTCOMAppIcon(size: 60)
            AXTCOMAppIcon(size: 90)
            AXTCOMAppIcon(size: 120)
        }

        // Logo on light bg
        HStack(spacing: 20) {
            AXTCOMLogo(size: 32)
            AXTCOMLogo(size: 48)
            AXTCOMLogo(size: 64)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(12)

        // Logo on dark bg
        HStack(spacing: 20) {
            AXTCOMLogo(size: 32, isDark: false)
            AXTCOMLogo(size: 48, isDark: false)
            AXTCOMLogo(size: 64, isDark: false)
        }
        .padding(16)
        .background(Color(hex: "0D47A1"))
        .cornerRadius(12)

        // Full wordmark
        HStack(spacing: 10) {
            AXTCOMLogo(size: 40)
            VStack(alignment: .leading, spacing: 1) {
                Text("AXTCOM")
                    .font(.system(size: 22, weight: .black, design: .rounded))
                    .foregroundColor(Color(hex: "0D47A1"))
                Text("Smart Contact Intelligence")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(Color(hex: "5C6BC0"))
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
    }
    .padding(32)
    .background(Color(hex: "F5F7FF"))
}
