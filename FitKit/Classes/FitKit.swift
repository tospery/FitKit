//
//  FitKit.swift
//  FitKit
//
//  Created by liaoya on 2021/12/9.
//

import UIKit
import DeviceKit

final public class FitKit {
    
    public static let shared = FitKit()
    
    /// 将屏幕分为普通和紧凑两种，这个方法用于判断普通屏幕（也即大屏幕）。
    /// @note 注意，这里普通/紧凑的标准是 QMUI 自行制定的，与系统 UITraitCollection.horizontalSizeClass/verticalSizeClass 的值无关。只要是通常意义上的“大屏幕手机”（例如 Plus 系列）都会被视为 Regular Screen。
    /// @NEW_DEVICE_CHECKER
    public static var isRegularScreen: Bool {
        let diagonal = Device.current.diagonal
        return (isPad || (!isZoomedMode && (diagonal == 6.7 || diagonal == 6.5 || diagonal == 6.1 || diagonal == 5.5)))
    }
    
    private static var dict: [String : [UIInterfaceOrientation : UIEdgeInsets]]?
    /// 用于获取 isNotchedScreen 设备的 insets，注意对于无 Home 键的新款 iPad 而言，它不一定有物理凹槽，但因为使用了 Home Indicator，所以它的 safeAreaInsets 也是非0。
    /// @NEW_DEVICE_CHECKER
    public static var safeAreaInsetsForDeviceWithNotch: UIEdgeInsets {
        if !isNotchedScreen {
            return .zero
        }
        
        if isPad {
            return .init(top: 24, left: 0, bottom: 20, right: 0)
        }
        
        if dict == nil {
            dict = [
                // iPhone 13 mini
                "iPhone14,4": [
                    .portrait: .init(top: 50, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 50, bottom: 21, right: 50)
                ],
                "iPhone14,4-Zoom": [
                    .portrait: .init(top: 43, left: 0, bottom: 29, right: 0),
                    .landscapeLeft: .init(top: 0, left: 43, bottom: 21, right: 43)
                ],
                // iPhone 13
                "iPhone14,5": [
                    .portrait: .init(top: 47, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 47, bottom: 21, right: 47)
                ],
                "iPhone14,5-Zoom": [
                    .portrait: .init(top: 39, left: 0, bottom: 28, right: 0),
                    .landscapeLeft: .init(top: 0, left: 39, bottom: 21, right: 39)
                ],
                // iPhone 13 Pro
                "iPhone14,2": [
                    .portrait: .init(top: 47, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 47, bottom: 21, right: 47)
                ],
                "iPhone14,2-Zoom": [
                    .portrait: .init(top: 39, left: 0, bottom: 28, right: 0),
                    .landscapeLeft: .init(top: 0, left: 39, bottom: 21, right: 39)
                ],
                // iPhone 13 Pro Max
                "iPhone14,3": [
                    .portrait: .init(top: 47, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 47, bottom: 21, right: 47)
                ],
                "iPhone14,3-Zoom": [
                    .portrait: .init(top: 41, left: 0, bottom: 29 + 2.0 / 3.0, right: 0),
                    .landscapeLeft: .init(top: 0, left: 41, bottom: 21, right: 41)
                ],
                // iPhone 12 mini
                "iPhone13,1": [
                    .portrait: .init(top: 50, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 50, bottom: 21, right: 50)
                ],
                "iPhone13,1-Zoom": [
                    .portrait: .init(top: 43, left: 0, bottom: 29, right: 0),
                    .landscapeLeft: .init(top: 0, left: 43, bottom: 21, right: 43)
                ],
                // iPhone 12
                "iPhone13,2": [
                    .portrait: .init(top: 47, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 47, bottom: 21, right: 47)
                ],
                "iPhone13,2-Zoom": [
                    .portrait: .init(top: 39, left: 0, bottom: 28, right: 0),
                    .landscapeLeft: .init(top: 0, left: 39, bottom: 21, right: 39)
                ],
                // iPhone 12 Pro
                "iPhone13,3": [
                    .portrait: .init(top: 47, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 47, bottom: 21, right: 47)
                ],
                "iPhone13,3-Zoom": [
                    .portrait: .init(top: 39, left: 0, bottom: 28, right: 0),
                    .landscapeLeft: .init(top: 0, left: 39, bottom: 21, right: 39)
                ],
                // iPhone 12 Pro Max
                "iPhone13,4": [
                    .portrait: .init(top: 47, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 47, bottom: 21, right: 47)
                ],
                "iPhone13,4-Zoom": [
                    .portrait: .init(top: 41, left: 0, bottom: 29 + 2.0 / 3.0, right: 0),
                    .landscapeLeft: .init(top: 0, left: 41, bottom: 21, right: 41)
                ],
                // iPhone 11
                "iPhone12,1": [
                    .portrait: .init(top: 48, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 48, bottom: 21, right: 48)
                ],
                "iPhone12,1-Zoom": [
                    .portrait: .init(top: 44, left: 0, bottom: 31, right: 0),
                    .landscapeLeft: .init(top: 0, left: 44, bottom: 21, right: 44)
                ],
                // iPhone 11 Pro Max
                "iPhone12,5": [
                    .portrait: .init(top: 44, left: 0, bottom: 34, right: 0),
                    .landscapeLeft: .init(top: 0, left: 44, bottom: 21, right: 44)
                ],
                "iPhone12,5-Zoom": [
                    .portrait: .init(top: 40, left: 0, bottom: 30 + 2.0 / 3.0, right: 0),
                    .landscapeLeft: .init(top: 0, left: 40, bottom: 21, right: 40)
                ]
            ]
        }
        
        var deviceKey = Device.identifier
        if dict?[deviceKey] == nil {
            deviceKey = "iPhone14,2" // 默认按最新的 iPhone 13 Pro 处理，因为新出的设备肯定更大概率与上一代设备相似
        }
        if Device.current.isZoomed ?? false {
            deviceKey += "-Zoom"
        }
        
        var orientationKey: UIInterfaceOrientation!
        let orientation = UIApplication.shared.statusBarOrientation
        switch orientation {
        case .landscapeLeft, .landscapeRight:
            orientationKey = .landscapeLeft
        default:
            orientationKey = .portrait
        }
        
        var insets = dict?[deviceKey]?[orientationKey] ?? .zero
        if orientation == .portraitUpsideDown {
            insets = .init(top: insets.bottom, left: insets.left, bottom: insets.top, right: insets.right)
        } else if orientation == .landscapeRight {
            insets = .init(top: insets.top, left: insets.right, bottom: insets.bottom, right: insets.left)
        }
        
        return insets
    }
    
    init() {
        
    }
    
//    static func screenSize(inch: Double) -> CGSize {
//        .zero
//    }
    
}
