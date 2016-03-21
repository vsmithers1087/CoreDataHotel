//
//  ViewController.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "ViewController.h"
#import "HotelsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    
    [super loadView];
    [self setUpCustonLayout];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpViewController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setUpViewController{
    [self.navigationController setTitle:@"H & M"];
}

-(void)setUpCustonLayout{
    
    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
     UIButton *browseButton = [[UIButton alloc]init];
     UIButton *lookUPButton = [[UIButton alloc]init];
     UIButton *bookButton = [[UIButton alloc]init];
    
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    [lookUPButton setTitle:@"Look Up" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book" forState:UIControlStateNormal];
    
    [browseButton setBackgroundColor:[UIColor redColor]];
    [lookUPButton setBackgroundColor:[UIColor whiteColor]];
    [bookButton setBackgroundColor:[UIColor blueColor]];
    
    [browseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [lookUPButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [bookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lookUPButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    NSLayoutConstraint *bBLeading = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bBTrailing = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bBTop = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: + navigationBarHeight];
    
    NSLayoutConstraint *bBHeight = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.33 constant: 0];
    
    
    NSLayoutConstraint *lLLeading = [NSLayoutConstraint constraintWithItem:lookUPButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lLTrailing = [NSLayoutConstraint constraintWithItem:lookUPButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lLTop = [NSLayoutConstraint constraintWithItem:lookUPButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:browseButton attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lLHeight = [NSLayoutConstraint constraintWithItem:lookUPButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.33 constant: 0];
    
    
    NSLayoutConstraint *bLeading = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bTrailing = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bTop = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lookUPButton attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bHeight = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.33 constant:0];
    
    
    //setUP contraints
    
    [self.view addSubview:browseButton];
    [self.view addSubview:lookUPButton];
    [self.view addSubview:bookButton];
    
    
    //set contraints to active.
    
    bBLeading.active = YES;
    bBTrailing.active = YES;
    bBTop.active = YES;
    bBHeight.active = YES;
    
    lLLeading.active = YES;
    lLTrailing.active = YES;
    lLTop.active = YES;
    lLHeight.active = YES;
    
    bLeading.active = YES;
    bTrailing.active = YES;
    bTop.active = YES;
    bHeight.active = YES;

    
    [browseButton addTarget:self action:@selector(browseButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [lookUPButton addTarget:self action:@selector(lookUpButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [bookButton addTarget:self action:@selector(bookButtonSelected:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)browseButtonSelected:(UIButton*)sender {
    HotelsViewController *hotelViewController = [[HotelsViewController alloc]init];
    
    [self.navigationController pushViewController:hotelViewController animated:YES];
    

}

-(void)lookUpButtonSelected:(UIButton*)sender {

    
}


-(void)bookButtonSelected:(UIButton*)sender {

}




@end
