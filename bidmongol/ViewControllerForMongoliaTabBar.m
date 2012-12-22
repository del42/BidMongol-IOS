//
//  ViewControllerForMongoliaTabBar.m
//  bidmongol
//
//  Created by Delgersuren Bold on 12/20/12.
//
//

#import "ViewControllerForMongoliaTabBar.h"

@interface ViewControllerForMongoliaTabBar ()
{
    NSMutableArray *array;
    NSDictionary *customerDetailDict;
    
}
@end

@implementation ViewControllerForMongoliaTabBar
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
    //[button1 setTitle:@"My Title" forState:UIControlStateNormal];
    [super viewDidLoad];
    [[self customerList]setDelegate:self];
    [[self customerList]setDataSource:self];
    array = [[NSMutableArray alloc]init];
    
    //Postgres db
    NSString *urlString = [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/postgres-db-to-json-customer.php"];
    //Runing Postgres locally
    //NSString *urlString = [NSString stringWithFormat:@"http://localhost:8888/example/drivers.php"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    NSMutableArray *customersData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    //NSLog(@"%@", customersData);
    NSMutableDictionary *temporaryDictionryForGlobalDictionary = [NSMutableDictionary dictionary];
    int c;
    for (c=0;c<customersData.count;c++ ){
        NSMutableArray *cusInfo = (NSMutableArray*)[customersData objectAtIndex:c];
        //NSLog(@"cusInfo is :%@",cusInfo );
        NSString *cDetail=[cusInfo objectAtIndex:0];
        //NSLog(@"cDetail is :%@",cDetail );
        //[[customerDetailDict objectForKey:cDetail] addObject:cusInfo];
        [temporaryDictionryForGlobalDictionary setObject:cusInfo forKey:cDetail];
    }
    customerDetailDict = temporaryDictionryForGlobalDictionary;
    NSLog(@"Dict is :%@",customerDetailDict );
    int i;
    for (i=0;i<customersData.count;i++){
        NSMutableArray *cID=(NSMutableArray*)[customersData objectAtIndex:i];
        int j;
        //NSLog(@"%u", cID.count);
        //NSLog(@"%@", cID);
        for  (j=0;j<cID.count;j++){
            NSMutableArray *cDetail=[cID objectAtIndex:j];
            //NSLog(@"customer info is %@", [cID objectAtIndex:j]);
            //NSLog(@"%@", cDetail);
            if (j%6==0)[array addObject:cDetail];
        }
        //        NSDictionary *name = [[customersData objectAtIndex:i] objectForKey:@"cName"];
        //            NSLog(@"cName");
        //            [array addObject:name]
    }
    
}

- (void)viewDidUnload
{
    [self setCustomerList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
    [self performSegueWithIdentifier:@"detailCustomerShowMon" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailCustomerShowMon"]) {
        NSIndexPath *indexPath = [self.customerList indexPathForSelectedRow];
        ViewControllerForMongoliaTabBarDetail *vc4 = segue.destinationViewController;
        NSString *cellname = [array objectAtIndex:indexPath.row];
        vc4.cellName =cellname;
    }
}
- (IBAction)refreshButton:(id)sender {
    
    //NSLog(@"cName");
}
@end
