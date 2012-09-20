//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Benson on 9/19/12.
//  Copyright (c) 2012 q10. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end



@implementation CalculatorBrain

// synthesize creates the getters and setters, but you can override with your custom version of a getter or setter
@synthesize operandStack = _operandStack;

// makes sure the operandStack is initialized (no null pointers, lazy instantiation)
- (NSMutableArray *)operandStack {
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (double) popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (void)pushOperand:(double)operand {
    // pushes operand to stack
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (double)performOperation:(NSString *)operation {
    double result = 0;
    
    // @ means NSString, otherwise it's a const char *
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operation isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] /divisor;
    }
    
    [self pushOperand:result];
    
    return result;
    
}


@end
