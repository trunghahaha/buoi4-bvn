//
//  Car.m
//  Buoi4 - BVN1
//
//  Created by doductrung on 5/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "Car.h"

@implementation Car
- (void) speedUp {
    
}
- (void) slowDown {
    
}
- (void) stop {
    
}
- (id) initCar {
    if(self == [super init]){
        _v = 0.0;
        _g = 0.0;
        _gas = 100.0;
    }
    return self;
}
@end
