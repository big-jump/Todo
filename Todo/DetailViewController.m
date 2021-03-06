//
//  DetailViewController.m
//  Todo
//
// Copyright (c) 2011 Treeness, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DetailViewController.h"
#import "TodoItem.h"

@implementation DetailViewController

@synthesize detailItem = __detailItem;
@synthesize dueDateFormatter = __dueDateFormatter;
@synthesize dueDatePicker = __duedatePicker;

- (void)dealloc
{
    [__detailItem release];
    [__dueDateFormatter release];
    [__duedatePicker release];
    
    [super dealloc];
}

- (IBAction)dateDidChange:(id)sender
{
    UIDatePicker *datePicker = (UIDatePicker*)sender;
    self.detailItem.dueDate = datePicker.date;
    
    NSIndexPath *dueDateIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:dueDateIndexPath];
    UITextField *dateTextField = (UITextField*)cell.accessoryView;
    dateTextField.text = [self.dueDateFormatter stringFromDate:self.detailItem.dueDate];
}

- (NSDateFormatter*)dueDateFormatter
{
    if (__dueDateFormatter != nil) {
        return __dueDateFormatter;
    }
    
    __dueDateFormatter = [[NSDateFormatter alloc] init];
    __dueDateFormatter.dateStyle = NSDateFormatterMediumStyle;
    __dueDateFormatter.timeStyle = NSDateFormatterShortStyle;
    return __dueDateFormatter;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Details";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSIndexPath *nameIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:nameIndexPath];
    UITextField *nameTextField = (UITextField*)cell.accessoryView;
    self.detailItem.name = nameTextField.text;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    CGRect textFieldRect = CGRectMake(0, 0, 200, 21);
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"name";
        UITextField *nameField = [[UITextField alloc] initWithFrame:textFieldRect];
        nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
        cell.accessoryView = nameField;
        nameField.text = self.detailItem.name;
        [nameField release];
    }
    else {
        cell.textLabel.text = @"due date";
        UITextField *dateField = [[UITextField alloc] initWithFrame:textFieldRect];
        cell.accessoryView = dateField;
        dateField.text = [self.dueDateFormatter stringFromDate:self.detailItem.dueDate];
        dateField.inputView = self.dueDatePicker;
        [dateField release];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UITextField *textField = (UITextField*)cell.accessoryView;
    [textField becomeFirstResponder];
}

@end
