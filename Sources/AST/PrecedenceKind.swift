//
//  PrecedenceKind.swift
//  Sema
//
//  Created by Yusuke Kita on 11/15/18.
//

import Syntax

enum PrecedenceKind: UInt {
    case lowest
    case equals
    case lessOrGreater
    case sum
    case product
    case prefix
    case call
  	case high
    case index
	  
}

extension PrecedenceKind {
    static func precedence(for tokenType: TokenType) -> PrecedenceKind {
        switch tokenType {
        case .equal, .notEqual: return .equals
        case .lessThan, .greaterThan: return .lessOrGreater
        case .plus, .minus: return .sum
        case .slash, .asterisk: return .product
        case .contains, .in: return .high
        case .leftParen: return .call
        case .leftBracket: return .index
        default: return .lowest
        }
    }
}
