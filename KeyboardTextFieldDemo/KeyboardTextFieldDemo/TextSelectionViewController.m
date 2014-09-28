//
//  ViewController.m
//  KeyboardTextFieldDemo

#import "TextSelectionViewController.h"

@interface TextSelectionViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation TextSelectionViewController

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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _data = @[@"Hello", @"This is a demo code", @"Issue #56", @"With mutiple cells", @"And some useless text.",
              @"Hello", @"This is a demo code", @"Issue #56", @"With mutiple cells", @"And some useless text.",
              @"Hello", @"This is a demo code", @"Issue #56", @"With mutiple cells", @"And some useless text."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _tableView.rowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(5,7,135,30)];
        textView.text = [_data objectAtIndex:indexPath.row];
        textView.dataDetectorTypes = UIDataDetectorTypeAll;
        textView.scrollEnabled = NO;
        textView.editable = NO;
        [cell.contentView addSubview:textView];
    }
    
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

@end
