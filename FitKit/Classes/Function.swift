//
//  Function.swift
//  FitKit
//
//  Created by liaoya on 2021/12/9.
//

import UIKit

//// 区分紧凑屏
//public func alternate(regular: CGFloat, compact: CGFloat) -> CGFloat {
//-    return (UIScreen.isRegular ? regular : compact)
//+    return (isRegularScreen ? regular : compact)
//}

/// 区分全面屏和非全面屏
public func preferredValue(notched: CGFloat, other: CGFloat) -> CGFloat {
    return (isNotchedScreen ? notched : other)
}

/// 将所有屏幕按照宽松/紧凑分类，其中 iPad、iPhone XS Max/XR/Plus 均为宽松屏幕，但开启了放大模式的设备均会视为紧凑屏幕
public func preferredValue(regular: CGFloat, compact: CGFloat) -> CGFloat {
    return (isRegularScreen ? regular : compact)
}
