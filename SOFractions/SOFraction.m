//
//  SOFraction.m
//  SOFractions
//
//  Created by Sergey on 17.02.15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "SOFraction.h"

@interface SOFraction ()

@property int holeNumber;

@end

@implementation SOFraction

@synthesize numerator = _numerator, denominator = _denominator, holeNumber = _holeNumber;

-(void)setNumerator:(int)numerator {
    
    _numerator = numerator;
    
}

-(int)numerator {
    
    return _numerator;
    
}

-(void)setDenominator:(int)denominator {
    
    _denominator = denominator;
    
}

-(int)denominator {
    
    return _denominator;
    
}

-(NSString *)description {
    
    NSString *result = [[NSString alloc] init];
    
    if (_holeNumber != 0) {
        
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%i %i/%i", _holeNumber, _numerator, abs(_denominator)]];
        
        return result;
        
    } else {
        
        if (_denominator < 0) {
            
            result = [result stringByAppendingString:[NSString stringWithFormat:@"-%i/%i", _numerator, abs(_denominator)]];
            
            return result;
        }
        
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%i/%i", _numerator, _denominator]];
        
        return result;
        
    }

    
    return nil;
    
}

- (void)checkForHoleNumber:(SOFraction *)temp {
    
    if (temp.numerator > temp.denominator) {
        
        temp.holeNumber = temp.numerator / temp.denominator;
        
        temp.numerator = temp.numerator - abs(temp.denominator);
        
    }
    
}

- (SOFraction *)add:(SOFraction *)f {
    
    SOFraction *temp = [[SOFraction alloc] init];
    
    temp.numerator = _numerator * f.denominator + _denominator * f.numerator;
    temp.denominator = _denominator * f.denominator;
    
    [temp reduce];
    
    [self checkForHoleNumber:temp];
    
    return temp;
}

- (SOFraction *)subtract:(SOFraction *)f {
    
    SOFraction *temp = [[SOFraction alloc] init];
    
    temp.numerator = _numerator * f.denominator - _denominator * f.numerator;
    
    temp.denominator = _denominator * f.denominator;
    
    [temp reduce];
    
    [self checkForHoleNumber:temp];
    
    return temp;
}

- (SOFraction *)multiply:(SOFraction *)f {
    
    SOFraction *temp = [[SOFraction alloc] init];
    
    temp.numerator = _numerator * f.numerator;
    temp.denominator = _denominator * f.denominator;
    
    [temp reduce];
    
    [self checkForHoleNumber:temp];
    
    return temp;
}

- (SOFraction *)divide:(SOFraction *)f {
    
    SOFraction *temp = [[SOFraction alloc] init];
    
    temp.numerator = _numerator * f.denominator;
    temp.denominator = _denominator * f.numerator;
    
    [temp reduce];
    
    [self checkForHoleNumber:temp];
    
    return temp;
}

-(void) reduce {
    
    int u = self.numerator;
    int v = self.denominator;
    int temp;
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    self.numerator /= u;
    self.denominator /= u;
}

@end







