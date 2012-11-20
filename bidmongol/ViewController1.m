//
//  ViewController1.m
//  bidmongol
//
//  Created by Delgersuren Bold on 8/23/12.
//
//

#import "ViewController1.h"

@interface ViewController1 ()
{
    NSMutableArray *array;
    
}
@end

@implementation ViewController1
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
       
    NSString *urlString = [NSString stringWithFormat:@"http://dbproj.sfsu.edu/~dbold/ios.customer.php"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    NSMutableArray *customerData = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", customerData);
    int i;
    for (i=0;i<customerData.count;i++){
        NSLog(@"%@", [customerData objectAtIndex:i]);
        NSDictionary *name = [[customerData objectAtIndex:i] objectForKey:@"cName"];
            NSLog(@"cName");
            [array addObject:name];
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)refreshButton:(id)sender {
    
    [self.tableView reloaddata];
}
@end
