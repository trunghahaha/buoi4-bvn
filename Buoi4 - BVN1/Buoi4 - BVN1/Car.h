//
//  Car.h
//  Buoi4 - BVN1
//
//  Created by doductrung on 5/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
// van toc
@property (nonatomic, assign) float v;
// gia toc
@property (nonatomic, assign) float g;
// hinh anh o to
@property (nonatomic, assign) float gas;
@property (weak, nonatomic) IBOutlet UIImageView *carImgView;
- (void) speedUp;
- (void) slowDown;
- (void) stop;
- (id) initCar;
@end
