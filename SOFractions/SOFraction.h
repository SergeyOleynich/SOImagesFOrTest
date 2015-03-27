//
//  SOFraction.h
//  SOFractions
//
//  Created by Sergey on 17.02.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOFraction : NSObject

@property int numerator;
@property int denominator;

- (SOFraction *)add:(SOFraction *)f;

- (SOFraction *)subtract:(SOFraction *)f;

- (SOFraction *)multiply:(SOFraction *)f;

- (SOFraction *)divide:(SOFraction *)f;

-(void) reduce;

@end
