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

/// 是否全面屏设备
public var isNotchedScreen: Bool { Device.current.hasSensorHousing }

// MARK: - 变量-布局相关

/// 状态栏高度(来电等情况下，状态栏高度会发生变化，所以应该实时计算，iOS 13 起，来电等情况下状态栏高度不会改变)
public var statusBarHeight: CGFloat { (UIApplication.shared.isStatusBarHidden ? 0 : UIApplication.shared.statusBarFrame.size.height) }

///// 状态栏高度(如果状态栏不可见，也会返回一个普通状态下可见的高度)
//#define StatusBarHeightConstant (UIApplication.sharedApplication.statusBarHidden ? (IS_IPAD ? (IS_NOTCHED_SCREEN ? 24 : 20) : PreferredValueForNotchedDevice(IS_LANDSCAPE ? 0 : ([[QMUIHelper deviceModel] isEqualToString:@"iPhone12,1"] ? 48 : (IS_61INCH_SCREEN_AND_IPHONE12 || IS_67INCH_SCREEN ? 47 : 44)), 20)) : UIApplication.sharedApplication.statusBarFrame.size.height)
//public var statusBarHeightConstant: CGFloat {
////    (UIApplication.shared.isStatusBarHidden ? (isPad ? (isNotchedScreen ? 24 : 20) : preferredValue(notched: isLandscape ? 0 : (SWHelper.deviceModel == "iPhone12,1" ? 48 : (SWHelper.is61InchScreenAndiPhone12 || SWHelper.is61InchScreen ? 47 : 44)) , other: 20)) : UIApplication.shared.statusBarFrame.size.height)
//
//    (UIApplication.shared.isStatusBarHidden ? (isPad ? (isNotchedScreen ? 24 : 20) : PreferredValueForNotchedDevice(IS_LANDSCAPE ? 0 : ([[QMUIHelper deviceModel] isEqualToString:@"iPhone12,1"] ? 48 : (IS_61INCH_SCREEN_AND_IPHONE12 || IS_67INCH_SCREEN ? 47 : 44)), 20)) : UIApplication.sharedApplication.statusBarFrame.size.height)
//}
