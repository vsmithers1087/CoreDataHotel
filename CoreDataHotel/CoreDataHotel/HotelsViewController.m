//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Vince Smithers. All rights reserved.
//

#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"
#import "RoomsViewController.h"

@interface HotelsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *datasource;
@property (strong, nonatomic) UITableView *tableview;
@end

@implementation HotelsViewController

-(NSArray *)datasource{

    if (!_datasource){
        
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = delegate.managedObjectContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        
        NSError *error;
        
        _datasource = [context executeFetchRequest:request error:&error];
        
        if (error) {
            NSLog(@"error %@", error);
        }
    }
    return _datasource;
}

-(void)loadView{
    
    [super loadView];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self setUpHotelsViewController];
    [self setUpTableView];
}



-(void)setUpHotelsViewController {
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setUpTableView{
    self.tableview = [[UITableView alloc]init];
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    [self.view addSubview:self.tableview];
    
    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSLayoutConstraint *tLeading = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
     NSLayoutConstraint *tTrailing = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
     NSLayoutConstraint *tTop = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];
    
     NSLayoutConstraint *tBotton = [NSLayoutConstraint constraintWithItem: self.tableview attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0];
    
    
    tLeading.active = YES;
    tTrailing.active = YES;
    tTop.active = YES;
    tBotton.active = YES;
    
    //set contraints
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Hotel *hotel = [self.datasource objectAtIndex:indexPath.row];
    
    cell.textLabel.text = hotel.name;
    
    cell.layer.borderWidth = 1.0;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 250.0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIImage *headImage = [UIImage imageNamed:@"hotel"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:headImage];
    
    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    imageView.frame = CGRectMake(0, navigationBarHeight, CGRectGetWidth(self.tableview.frame), 100.0);
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    
    return imageView;
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Hotel *selectHotel = _datasource[indexPath.row];
    
    NSMutableArray *rooms = [[NSMutableArray alloc]init];
    
    for (Room *room in selectHotel.rooms) {
        [rooms addObject:room];
    }
    
    RoomsViewController *roomsViewController = [[RoomsViewController alloc]init];
    
    roomsViewController.dataSource = rooms;
    
    [self.navigationController pushViewController:roomsViewController animated:YES];
    
}

@end
