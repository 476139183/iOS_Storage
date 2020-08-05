//
//  DingStockExtensionWrapper.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import Foundation

public protocol DingStockWrappable {
    associatedtype WrapperType
    var ds: WrapperType { get }
    static var ds: WrapperType.Type { get }
}

public extension DingStockWrappable {
    var ds: DingStockWrapper<Self> {
        return DingStockWrapper(value: self)
    }
    static var ds: DingStockWrapper<Self>.Type {
        return DingStockWrapper.self
    }
}

public protocol DingStockWrapperProtocol {
    associatedtype WrappedType
    
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

public struct DingStockWrapper<T>: DingStockWrapperProtocol {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
