//
//  Constant.swift
//  FitKit
//
//  Created by liaoya on 2021/12/9.
//

import UIKit
import DeviceKit

// MARK: - 变量-设备相关

/// 设备类型
public var isPad: Bool { Device.current.isPad }
public var isPod: Bool { Device.current.isPod }
public var isPhone: Bool { Device.current.isPhone }
public var isSimulator: Bool { Device.current.isSimulator }

/// 操作系统版本号，只获取第二级的版本号，例如 10.3.1 只会得到 10.3
public var osVersion: Double { (UIDevice.current.systemVersion as NSString).doubleValue }

/// 是否横竖屏
/// 用户界面横屏了才会返回YES
public var isLandscape: Bool { UIApplication.shared.statusBarOrientation.isLandscape }
/// 无论支不支持横屏，只要设备横屏了，就会返回YES
public var isDeviceLandscape: Bool { UIDevice.current.orientation.isLandscape }

/// 屏幕宽度，会根据横竖屏的变化而变化
public var screenWidth: CGFloat { UIScreen.main.bounds.size.width }

/// 屏幕高度，会根据横竖屏的变化而变化
public var screenHeight: CGFloat { UIScreen.main.bounds.size.height }

/// 设备宽度，跟横竖屏无关
public var deviceWidth: CGFloat { min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) }

/// 设备高度，跟横竖屏无关
public var deviceHeight: CGFloat { max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) }

/// 是否全面屏设备
public var isNotchedScreen: Bool { Device.current.hasSensorHousing }

/// 是否宽松屏设备
public var isRegularScreen: Bool { FitKit.isRegularScreen }

/// 是否放大模式（iPhone 6及以上的设备支持放大模式，iPhone X 除外）
public var isZoomedMode: Bool { Device.current.isZoomed ?? false }

// MARK: - 变量-布局相关

/// 状态栏高度(来电等情况下，状态栏高度会发生变化，所以应该实时计算，iOS 13 起，来电等情况下状态栏高度不会改变)
public var statusBarHeight: CGFloat { (UIApplication.shared.isStatusBarHidden ? 0 : UIApplication.shared.statusBarFrame.size.height) }

/// 状态栏高度(如果状态栏不可见，也会返回一个普通状态下可见的高度)
public var statusBarHeightConstant: CGFloat {
    (UIApplication.shared.isStatusBarHidden ? (isPad ? (isNotchedScreen ? 24 : 20) : preferredValue(notched: isLandscape ? 0 : (Device.identifier == "iPhone12,1" ? 48 : (Device.current.diagonal == 6.1 ? 47 : 44)), other: 20)) : UIApplication.shared.statusBarFrame.size.height)
}
