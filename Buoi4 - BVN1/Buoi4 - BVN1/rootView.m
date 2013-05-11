//
//  rootView.m
//  Buoi4 - BVN1
//
//  Created by doductrung on 5/11/13.
//  Copyright (c) 2013 doductrung. All rights reserved.
//

#import "rootView.h"
#import "View1.h"
@interface rootView ()

@end

@implementation rootView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushNextView)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.nextImgView addGestureRecognizer:singleTap];
    [self.nextImgView setUserInteractionEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) pushNextView {
    View1 *view1 = [[View1 alloc] initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:view1 animated: YES];
}
@end
