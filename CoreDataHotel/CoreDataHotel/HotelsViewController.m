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
#import "HotelsViewController.h"
#import "NSManagedObjectContext+NSMangagedObjectCategory.h"

@interface HotelsViewController ()<UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
@property(strong, nonatomic)NSFetchedResultsController *fetchController;
@property (strong, nonatomic) UITableView *tableview;
@end

@implementation HotelsViewController

-(NSFetchedResultsController*)fetchController {
    
    if (!_fetchController) {
        NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
        
        _fetchController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
        
        _fetchController.delegate = self;
        
        NSError *error;
        
        [_fetchController performFetch:&error];
        
    }
    return _fetchController;
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

/*
 Assume self has a property 'tableView' -- as is the case for an instance of a UITableViewController
 subclass -- and a method configureCell:atIndexPath: which updates the contents of a given cell
 with information from a managed object at the given index path in the fetched results controller.
 */

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableview beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableview insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableview deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableview;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableview endUpdates];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[[self.fetchController sections]objectAtIndex:section]numberOfObjects];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Hotel *hotel = [self.fetchController objectAtIndexPath:indexPath];
    
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
    
    Hotel *selectHotel = [self.fetchController objectAtIndexPath:indexPath];
    
    NSMutableArray *rooms = [[NSMutableArray alloc]init];
    
    for (Room *room in selectHotel.rooms) {
        [rooms addObject:room];
    }
    
    RoomsViewController *roomsViewController = [[RoomsViewController alloc]init];
    
    roomsViewController.dataSource = rooms;
    
    [self.navigationController pushViewController:roomsViewController animated:YES];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Hotel *selectedHotel = [self.fetchController  objectAtIndexPath:indexPath];
        NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
        
        [context deleteObject:selectedHotel];
        
        
        
    }
}

@end
