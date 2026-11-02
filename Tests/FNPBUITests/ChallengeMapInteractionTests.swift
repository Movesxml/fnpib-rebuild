import XCTest
import CoreGraphics
@testable import FNPBUI

final class ChallengeMapInteractionTests: XCTestCase {
    private let rectangle = [
        CGPoint(x: 0, y: 0), CGPoint(x: 10, y: 0),
        CGPoint(x: 10, y: 10), CGPoint(x: 0, y: 10),
    ]

    func testRectangleInteriorBoundaryAndExterior() {
        for point in [CGPoint(x: 5, y: 5), CGPoint(x: 0, y: 0),
                      CGPoint(x: 10, y: 5), CGPoint(x: 5, y: 10)] {
            XCTAssertTrue(ChallengeMapHitGeometry.contains(point: point, quad: rectangle))
        }
        for point in [CGPoint(x: 11, y: 5), CGPoint(x: 5, y: -1),
                      CGPoint(x: -1, y: 5), CGPoint(x: 5, y: 11)] {
            XCTAssertFalse(ChallengeMapHitGeometry.contains(point: point, quad: rectangle))
        }
    }

    func testRotatedAndNegativeScaleQuads() {
        let rotated = [CGPoint(x: 0, y: -10), CGPoint(x: 10, y: 0),
                       CGPoint(x: 0, y: 10), CGPoint(x: -10, y: 0)]
        XCTAssertTrue(ChallengeMapHitGeometry.contains(point: .zero, quad: rotated))
        XCTAssertTrue(ChallengeMapHitGeometry.contains(point: CGPoint(x: 0, y: 10), quad: rotated))
        XCTAssertFalse(ChallengeMapHitGeometry.contains(point: CGPoint(x: 8, y: 8), quad: rotated))

        let reversed = [CGPoint(x: 10, y: 10), CGPoint(x: 10, y: 0),
                        CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 10)]
        XCTAssertTrue(ChallengeMapHitGeometry.contains(point: CGPoint(x: 5, y: 5), quad: reversed))
        XCTAssertTrue(ChallengeMapHitGeometry.contains(point: .zero, quad: reversed))
        XCTAssertFalse(ChallengeMapHitGeometry.contains(point: CGPoint(x: 11, y: 5), quad: reversed))
    }

    func testInvalidInputAndDegenerateQuadsReturnFalse() {
        XCTAssertFalse(ChallengeMapHitGeometry.contains(
            point: CGPoint(x: CGFloat.nan, y: 5), quad: rectangle))
        XCTAssertFalse(ChallengeMapHitGeometry.contains(
            point: CGPoint(x: 5, y: CGFloat.infinity), quad: rectangle))
        XCTAssertFalse(ChallengeMapHitGeometry.contains(
            point: CGPoint(x: 5, y: 5), quad: Array(rectangle.prefix(3))))
        var invalid = rectangle
        invalid[2].y = .nan
        XCTAssertFalse(ChallengeMapHitGeometry.contains(
            point: CGPoint(x: 5, y: 5), quad: invalid))
        let collinear = [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0),
                         CGPoint(x: 2, y: 0), CGPoint(x: 3, y: 0)]
        XCTAssertFalse(ChallengeMapHitGeometry.contains(
            point: CGPoint(x: 1, y: 0), quad: collinear))
        XCTAssertFalse(ChallengeMapHitGeometry.contains(
            point: .zero, quad: Array(repeating: .zero, count: 4)))
    }
}
