//
//  ViewController4.m
//  bidmongol
//
//  Created by Delgersuren Bold on 12/18/12.
//
//

#import "ViewControllerFirstTabBarDetail.h"
#import "ViewControllerFirstTabBar.h"

@interface ViewControllerFirstTabBarDetail ()

@end

@implementation ViewControllerFirstTabBarDetail
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
    NSError *error;
    NSString *customerIDequalsToCellname;
    
    NSString *urlStringOrders = [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/webserver-to-db-orders.php"];
    NSURL *urlOrders = [NSURL URLWithString:urlStringOrders];
    NSData *dataOrders = [NSData dataWithContentsOfURL:urlOrders];
    NSMutableArray *ordersData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:dataOrders options:kNilOptions error:&error];
    
    NSString *urlStringCustomer= [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/postgres-db-to-json-customer.php"];
    NSURL *urlCustomer= [NSURL URLWithString:urlStringCustomer];
    NSData *dataCustomer= [NSData dataWithContentsOfURL:urlCustomer];
    NSMutableArray *customersData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:dataCustomer options:kNilOptions error:&error];
    
    for (int i=0;i<ordersData.count;i++){
        NSMutableArray *ordersDetailedInfo=(NSMutableArray*)[ordersData objectAtIndex:i];
        
        if ([[ordersDetailedInfo objectAtIndex:0] intValue] == [cellName intValue]){
          customerIDequalsToCellname = [ordersDetailedInfo objectAtIndex:4];
        }
    }
    
    for (int j=0;j<customersData.count;j++){
        NSMutableArray *customerDetailedInfo=(NSMutableArray*)[customersData objectAtIndex:j];
        
        if ([[customerDetailedInfo objectAtIndex:0] intValue] == [customerIDequalsToCellname intValue]){
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
