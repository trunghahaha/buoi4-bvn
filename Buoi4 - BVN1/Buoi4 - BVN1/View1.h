//
//  View1.h
//  Buoi4 - BVN1
//
//  Created by doductrung on 5/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View1 : UIViewController {
}
@property (nonatomic, assign)int speedUpTimeCount;
@property (nonatomic, strong) NSTimer *timer;
// bien rieng dem thoi gian xe chay
@property (nonatomic, strong) NSTimer *runningTimer;
@property (weak, nonatomic) IBOutlet UIImageView *carImgView;
@property (weak, nonatomic) IBOutlet UIImageView *treeView;
@property (weak, nonatomic) IBOutlet UILabel *vLb;
@property (weak, nonatomic) IBOutlet UILabel *gLb;
@property (weak, nonatomic) IBOutlet UILabel *gasLb;
- (IBAction)slowDownTap:(id)sender;
@end
