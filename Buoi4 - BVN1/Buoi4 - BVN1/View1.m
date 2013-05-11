//
//  View1.m
//  Buoi4 - BVN1
//
//  Created by doductrung on 5/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "View1.h"
#import "Car.h"
@interface View1 ()

@end

@implementation View1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

Car *myCar;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    myCar = [[Car alloc] initCar];
    myCar.carImgView = self.carImgView;
}
// hien thi hinh anh xe dang chay
- (void)displayCar: (UIImageView *)car duration: (float) duration {
    car.animationImages = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"car_03.png"],
                           [UIImage imageNamed:@"car_04.png"],
                           [UIImage imageNamed:@"car_05.png"],
                           [UIImage imageNamed:@"car_06.png"],
                           [UIImage imageNamed:@"car_08.png"],
                           [UIImage imageNamed:@"car_09.png"],
                           [UIImage imageNamed:@"car_10.png"],
                           [UIImage imageNamed:@"car_11.png"],
                           [UIImage imageNamed:@"car_12.png"],
                           [UIImage imageNamed:@"car_13.png"],
                           [UIImage imageNamed:@"car_14.png"],
                           [UIImage imageNamed:@"car_15.png"],
                           [UIImage imageNamed:@"car_16.png"],
                           [UIImage imageNamed:@"car_17.png"],
                           nil];
    [car setAnimationRepeatCount:0];
    [car setAnimationDuration:duration];
    [car startAnimating];
}
// hien thi cay ven duong
- (void)displayTree: (float) duration {
    self.treeView.animationImages = [NSArray arrayWithObjects:
                                     [UIImage imageNamed:@"background1.png"],
                                     [UIImage imageNamed:@"background2.png"],
                                     [UIImage imageNamed:@"background3.png"],
                                     [UIImage imageNamed:@"background4.png"],
                                     [UIImage imageNamed:@"background5.png"],
                                     nil];
    [self.treeView setAnimationRepeatCount:0];
    [self.treeView setAnimationDuration:duration];
    [self.treeView startAnimating];
}
// dung hoat hinh
- (void) stopAnimating: (UIImageView *)car{
    [car stopAnimating];
    [self.treeView stopAnimating];
}
// ham tinh toan toc do khi xe chay
- (void) running {
    int duration = 0;
    if(myCar.v == 0 || myCar.gas == 0) {
        [self stopAnimating:myCar.carImgView];
        return;
    }
    {
        if(myCar.v <=10 && myCar.v >0){
            duration = 4;
        }
        else if(myCar.v >10 && myCar.v <= 30){
            duration = 2;
        }else if(myCar.v > 30 && myCar.v <=50){
            duration = 0;
        }else if(myCar.v >50){
            duration = -100;
        }
        [self displayCar:myCar.carImgView duration:duration];
        [self displayTree:duration];
    }
}
// hien thi toc do
- (void) displaySpeed: (float) sp {
    [self.vLb setText:[NSString stringWithFormat:@"%2.2f",sp]];
}
// hien thi gia toc
- (void) displayAcceleration: (float) acc {
    [self.gLb setText:[NSString stringWithFormat:@"%2.2f",acc]];
}
// hien thi muc xang con lai
- (void) displayGas: (float) gas {
    [self.gasLb setText:[NSString stringWithFormat:@"%2.2f",gas]];
}

- (void) display {
    [self displaySpeed:myCar.v];
    [self displayAcceleration:myCar.g];
    [self displayGas:myCar.gas];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/// ham thay doi gia tri cac bien trong class car
- (void) speedUp {
    myCar.v  = myCar.v + myCar.g;
    myCar.g = myCar.g - 0.5;
    if(myCar.g < 0){
        myCar.g = 0;
        [self display];
        [self running];
        [self.timer invalidate];
        return;
    }
    [self display];
    [self running];
}
- (void) slowDown {
    myCar.v  = myCar.v - myCar.g;
    myCar.g = myCar.g + 0.5;
    if(myCar.g > 3){
        myCar.g = 0;
        [self display];
        [self running];
        [self.timer invalidate];
        return;
    }
    [self display];
    [self running];
}
- (void) stop {
    myCar.v  = myCar.v - myCar.g;
    myCar.g = myCar.g + 1;
    if(myCar.v < 0){
        myCar.v = 0;
        myCar.g = 0;
        [self display];
        [self running];
        [self.timer invalidate];
        return;
    }
    [self display];
    [self running];
}
- (void) gasCalculate {
    float gasLoss = 0;
    if(myCar.v <=10 && myCar.v > 0){
        gasLoss = 0.05;
    }
    else if(myCar.v >10 && myCar.v <= 30){
        gasLoss = 0.5;
    }else if(myCar.v > 30 && myCar.v <=50){
        gasLoss = 1;
    }else if(myCar.v >50 && myCar.v <= 200){
        gasLoss = 1.5;
    }else if(myCar.v >200){
        gasLoss = 4;
    }
    myCar.gas -= gasLoss;
    if(myCar.gas < 0) {
        myCar.gas = 0;
        [self stop];
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Out of gas!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        [self.runningTimer invalidate];
        return;
    }
    [self displayGas:myCar.gas];
}
///---bat su kien nhan nut--------------------------
- (IBAction)goTap:(id)sender {
    if(myCar.v == 0){
        if(myCar.gas > 0){
            myCar.v = 0;
            myCar.g = 5;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(speedUp) userInfo:nil repeats:YES];
            self.runningTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(gasCalculate) userInfo:nil repeats:YES];
        }else{
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Out of gas!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    }else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Car is running!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
- (IBAction)speedUpTap:(id)sender {
    if(myCar.gas > 0){
        if(myCar.v > 200){
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You reach max speed!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }else if(myCar.v !=0){
            myCar.g = 5;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(speedUp) userInfo:nil repeats:YES];
        }else{
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You must go first!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    }else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Out of gas!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
- (IBAction)stopTap:(id)sender {
    if(myCar.v != 0){
        myCar.g = 0;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(stop) userInfo:nil repeats:YES];
    }else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You must go first!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (IBAction)slowDownTap:(id)sender {
    if(myCar.v != 0){
        myCar.g = 0;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(slowDown) userInfo:nil repeats:YES];
    }else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You must go first!!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
- (IBAction)moreGasTap:(id)sender {
    myCar.gas += 5;
    [self displayGas:myCar.gas];
}
- (IBAction)fullGasTap:(id)sender {
    myCar.gas = 100;
    [self displayGas:myCar.gas];
}
@end
