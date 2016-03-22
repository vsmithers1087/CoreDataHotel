//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "BookViewController.h"
#import "ReservationService.h"
#import "NSManagedObjectContext+NSMangagedObjectCategory.h"

@interface BookViewController ()

@property(strong, nonatomic) UITextField *firstNameField;
@property(strong, nonatomic) UITextField *lastNameField;
@property(strong, nonatomic) UITextField *email;

@end

@implementation BookViewController

-(void)loadView {
    
    [super loadView];
    [self setUpCustomLayout];
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setUpCustomLayout {
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *button = [[UIButton alloc]init];
    
     [button setTitle:@"Save" forState:UIControlStateNormal];
     [button setBackgroundColor:[UIColor redColor]];
     [button setTranslatesAutoresizingMaskIntoConstraints:NO];
     [self.view addSubview:button];
    
    UITextField *firstNameField = [[UITextField alloc]init];
    UITextField *lastNameField = [[UITextField alloc]init];
    UITextField *email = [[UITextField alloc]init];
    
    firstNameField.placeholder = @"enter name";
    firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    
    lastNameField.placeholder = @"enter last name";
    lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    
    email.placeholder = @"enter email";
    email.borderStyle = UITextBorderStyleRoundedRect;
    
    firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    email.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *fNLeading = [NSLayoutConstraint constraintWithItem:firstNameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *fNTrailing = [NSLayoutConstraint constraintWithItem:firstNameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *fNTop = [NSLayoutConstraint constraintWithItem:firstNameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: + 100];
    
    
    NSLayoutConstraint *lNLeading = [NSLayoutConstraint constraintWithItem:lastNameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lNTrailing = [NSLayoutConstraint constraintWithItem:lastNameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *lNTop = [NSLayoutConstraint constraintWithItem:lastNameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:firstNameField attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: + 50];
    
    
    NSLayoutConstraint *eLeading = [NSLayoutConstraint constraintWithItem:email attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *eTrailing = [NSLayoutConstraint constraintWithItem:email attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *eTop = [NSLayoutConstraint constraintWithItem:email attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lastNameField attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: + 50];
    
    
    
    NSLayoutConstraint *bLeading = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bTrailing = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bTop = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:email attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: + 100];
    
    [self.view addSubview:firstNameField];
    [self.view addSubview:lastNameField];
    [self.view addSubview:email];
    
    fNLeading.active = YES;
    fNTrailing.active = YES;
    fNTop.active = YES;
    
    lNLeading.active = YES;
    lNTrailing.active = YES;
    lNTop.active = YES;
    
    eLeading.active = YES;
    eTrailing.active = YES;
    eTop.active = YES;
    
    bLeading.active = YES;
    bTrailing.active = YES;
    bTop.active = YES;
    
    _firstNameField = firstNameField;
    _lastNameField = lastNameField;
    _email = email;
    
    [button addTarget:self action:@selector(saveButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)saveButtonSelected:(UIButton*)sender{
    
    if (self.firstNameField.text.length > 0) {
        
        NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
        Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
        
        guest.name = self.firstNameField.text;
        guest.lastName = self.lastNameField.text;
        guest.email = self.email.text;
        
        [ReservationService bookReservationWithGuest:guest room:self.room startDate:self.startDate endDate:self.endDate];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

@end
