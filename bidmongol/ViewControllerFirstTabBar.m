//
//  ViewController1.m
//  bidmongol
//
//  Created by Delgersuren Bold on 8/23/12.
//
//

#import "ViewControllerFirstTabBar.h"

@interface ViewControllerFirstTabBar ()
{
    NSMutableArray *array;
    NSDictionary *customerDetailDict;
    
}
@end

@implementation ViewControllerFirstTabBar
@synthesize customerList;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self customerList]setDelegate:self];
    [[self customerList]setDataSource:self];
    array = [[NSMutableArray alloc]init];
    
    //Postgres db 
    //NSString *urlStringCustomers= [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/postgres-db-to-json-customer.php"];
    NSString *urlStringOrders = [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/webserver-to-db-orders.php"];
    //Runing Postgres locally
    //NSString *urlString = [NSString stringWithFormat:@"http://localhost:8888/example/drivers.php"];
    
    NSURL *urlOrders = [NSURL URLWithString:urlStringOrders];
    NSData *dataOrders = [NSData dataWithContentsOfURL:urlOrders];
    NSError *error;
    NSMutableArray *ordersData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:dataOrders options:kNilOptions error:&error];
       
//        //Load customer data in dictionary
//        NSMutableDictionary *temporaryDictionryForGlobalDictionary = [NSMutableDictionary dictionary];
//        for (int c=0;c<customersData.count;c++ ){
//            NSMutableArray *cusInfo = (NSMutableArray*)[customersData objectAtIndex:c];
//            NSString *cDetail=[cusInfo objectAtIndex:0];
//            [temporaryDictionryForGlobalDictionary setObject:cusInfo forKey:cDetail];
//        }
//        customerDetailDict = temporaryDictionryForGlobalDictionary;
        
        for (int i=0;i<ordersData.count;i++){
            NSMutableArray *eachOrderBundle=(NSMutableArray*)[ordersData objectAtIndex:i];
            int j;
            for  (j=0;j<eachOrderBundle.count;j++){
                NSMutableArray *eachOrderDetail=[eachOrderBundle objectAtIndex:j];
                if (j%6==0)[array addObject:eachOrderDetail];
            }
        }
}

- (void)viewDidUnload
{
    [self setCustomerList:nil];
    [super viewDidUnload];
    [super viewDidLoad];
 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [customerList release];
    [super dealloc];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    
    //[cell setAccessoryType:UIButtonTypeDetailDisclosure];
    cell.textLabel.text =[array objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detailCustomerShow" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailCustomerShow"]) {
        NSIndexPath *indexPath = [self.customerList indexPathForSelectedRow];
        ViewControllerFirstTabBarDetail *vc4 = segue.destinationViewController;
        NSString *cellname = [array objectAtIndex:indexPath.row];
        vc4.cellName =cellname;
    }
}
- (IBAction)refreshButton:(id)sender {
}
@end
