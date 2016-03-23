//
//  DateViewController.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "DateViewController.h"
#import "AvialibilityViewController.h"

@interface DateViewController()

@property(strong, nonatomic)UIDatePicker *startPicker;
@property(strong, nonatomic)UIDatePicker *endPicker;

@end

@implementation DateViewController

-(void)loadView {
    [super loadView];
    
    [self setUpCustomLayout];
    [self setUpDateViewController];
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(void)setUpCustomLayout{
    
    UIDatePicker *startPicker = [[UIDatePicker alloc]init];
    UIDatePicker *endPicker = [[UIDatePicker alloc]init];
    

    //labels
    
    startPicker.datePickerMode = UIDatePickerModeDate;
    endPicker.datePickerMode = UIDatePickerModeDate;
    
    startPicker.translatesAutoresizingMaskIntoConstraints = NO;
    
    endPicker.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: startPicker];
    [self.view addSubview: endPicker];
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    
    NSArray *startPickerHorizontalContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[startPicker]|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(startPicker)];
    
    NSArray *endPickerHorizontalContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[endPicker]|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(endPicker)];
    
    NSArray *startPickerVerticalContraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-44-[startPicker]-20-[endPicker]" options:NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(startPicker, endPicker)];
    
    [constraints addObjectsFromArray:endPickerHorizontalContraints];
    [constraints addObjectsFromArray:startPickerHorizontalContraints];
    [constraints addObjectsFromArray:startPickerVerticalContraints];
    
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
        
    }
    
    self.startPicker = startPicker;
    self.endPicker = endPicker;
    
}
-(void)setUpDateViewController{
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController setTitle:@"Select Dates"];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemDone target:self action:@selector(addButtonSelected:)]];
    
}
     
-(void)addButtonSelected:(UIBarButtonItem*)sender{
    if ([self.startPicker.date timeIntervalSinceReferenceDate] >= [self.endPicker.date timeIntervalSinceReferenceDate]) {
        
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Date Error" message:@"start date must come before end date" preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.startPicker setDate: [NSDate date]];
            [self.endPicker setDate: [NSDate date]];
            
        }];
        
        [controller addAction:okAction];
        [self presentViewController:controller animated:YES completion:nil];
    }else {
        
        AvialibilityViewController *availibilityViewController = [[AvialibilityViewController alloc]init];
        
        availibilityViewController.startDate = self.startPicker.date;
        availibilityViewController.endDate = self.endPicker.date;
        
       [self.navigationController pushViewController:availibilityViewController animated:YES];
        
    }
}
@end
