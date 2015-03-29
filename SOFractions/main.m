//
//  main.m
//  SOFractions
//
//  Created by Sergey on 17.02.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOFraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        SOFraction *fract = [[SOFraction alloc] init];
        fract.numerator = 2;
        fract.denominator = 1;
        
        
        SOFraction *fractt = [[SOFraction alloc] init];
        fractt.numerator = 2;
        fractt.denominator = 3;
        
        SOFraction *result = [[SOFraction alloc] init];
        result = [fractt multiply:fract];
        
        NSLog(@"%@", result.description);
        
    }
    return 0;
}
