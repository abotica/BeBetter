//
//  OffsetKey.swift
//  BeBetter
//
//  Created by Karlo Nevešćanin on 21.01.2024..
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
