//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Benson on 9/19/12.
//  Copyright (c) 2012 q10. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
