//
//  ViewControllerForUSwarehouseTabBarDetail.m
//  bidmongol
//
//  Created by Delgersuren Bold on 12/20/12.
//
//

#import "ViewControllerForUSwarehouseTabBarDetail.h"
#import "ViewControllerForUSwarehouseTabBar.h"

@interface ViewControllerForUSwarehouseTabBarDetail ()
{
    NSMutableArray *cDatas;
}

@end

@implementation ViewControllerForUSwarehouseTabBarDetail
@synthesize cellName;
@synthesize customerID;
@synthesize customerName;
@synthesize customerPhone;
@synthesize customerEmail;
@synthesize customerAddress;

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
    //cutomerName.text= cellName;
    NSLog(@"cellname = %@",cellName);
    NSString *urlString = [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/postgres-db-to-json-customer.php"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    NSMutableArray *customersData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    for (int i=0;i<customersData.count;i++){
        NSMutableArray *customerDetailedInfo=(NSMutableArray*)[customersData objectAtIndex:i];
        
        if ([[customerDetailedInfo objectAtIndex:0] intValue] == [cellName intValue]){
            customerID.text = [customerDetailedInfo objectAtIndex:0];
            customerName.text =[customerDetailedInfo objectAtIndex:1];
            customerPhone.text =[customerDetailedInfo objectAtIndex:2];
            customerEmail.text =[customerDetailedInfo objectAtIndex:3];
            customerAddress.text =[customerDetailedInfo objectAtIndex:4];
        }
    }
}

- (void)viewDidUnload
{
    [self setCustomerID:nil];
    [self setCustomerName:nil];
    [self setCustomerEmail:nil];
    [self setCustomerAddress:nil];
    [self setCustomerPhone:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [customerID release];
    [customerName release];
    [customerEmail release];
    [customerAddress release];
    [customerPhone release];
    [super dealloc];
}
@end

