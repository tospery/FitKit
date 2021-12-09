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
