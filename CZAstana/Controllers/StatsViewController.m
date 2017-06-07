//
//  StatsViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/24/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <BEMSimpleLineGraph/BEMSimpleLineGraphView.h>
#import "StatsViewController.h"
#import "UIColor+CZColor.h"
#import "UIFont+CZFont.h"
#import "HelperMethods.h"

@interface StatsViewController ()<BEMSimpleLineGraphDelegate, BEMSimpleLineGraphDataSource>

@property (nonatomic) BEMSimpleLineGraphView *graphView;
@property (nonatomic) UITextView *textView;
@property (nonatomic) UIScrollView *scrollView;

@property (nonatomic) NSMutableArray *years;
@property (nonatomic) NSArray *numbers;

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Уровень безработицы";
    
    self.years = [NSMutableArray new];
    for (int i = 2011; i < 2018; i++) {
        [self.years addObject:[NSNumber numberWithInt:i]];
    }
    
    self.numbers = @[@5.2, @5.1, @5.0, @4.9, @4.8, @4.9, @4.7];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    [self setGraph];
    [self setTextView];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(self.textView.frame)+64);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTextView{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.graphView.frame)+10, self.view.frame.size.width-30, 100)];
    self.textView.text = @"Астана қаласы бойынша статистика департаментінің ресми мәліметі бойынша 2017 жылдың I тоқсаныңда Астана қаласында жұмыссыздық деңгейі 4,6 (жылдық жоспар 4,7%) құрады. Елорда ең төменгі жұмыссыздық деңгейімен жетекші орынды алуды жалғастырды, бұл көрсеткіш республикалықтан 0,3% пунктке төмен. Өткен жылмен салыстырғанда жастар арасындағы жұмыссыздық 0,3% төмендеп, 4,5 пайызды құрады (жылдық жоспар 4,7%). Әйелдер арасындағы жұмыссыздық деңгейі де 0,4 пайызға төмендеп 4,5 пайызды құрады (жылдық жоспар 4,9%). Статистикалық мәлімет бойынша, жыл басынан бері Астанада 6 мыңнан астам, соның ішінде 5 мыңға жуық шағын және орта бизнес саласында жаңа жұмыс орындары құрылған.";
    self.textView.editable = NO;
    self.textView.selectable = NO;
    self.textView.scrollEnabled = NO;
    self.textView.font = [UIFont fontLightWithSize:17.0f];
    [self.scrollView addSubview:self.textView];
    [HelperMethods textViewDidChange:self.textView];
}

-(void)setGraph{
    self.graphView = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.graphView.delegate = self;
    self.graphView.dataSource = self;
    self.graphView.colorTop = [UIColor newLightBlueColor];
    self.graphView.colorBottom = [UIColor mainGreenColor];
    self.graphView.widthLine = 3.0f;
    self.graphView.tintColor = [UIColor whiteColor];
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = {
        1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 0.0
    };
    
    // Apply the gradient to the bottom portion of the graph
    self.graphView.gradientBottom = CGGradientCreateWithColorComponents(colorspace, components, locations, num_locations);
    
    // Enable and disable various graph properties and axis displays
    self.graphView.enableTouchReport = YES;
    self.graphView.enablePopUpReport = YES;
    self.graphView.enableYAxisLabel = YES;
    self.graphView.autoScaleYAxis = YES;
    self.graphView.alwaysDisplayDots = YES;
    self.graphView.enableReferenceXAxisLines = YES;
    self.graphView.enableReferenceYAxisLines = YES;
    self.graphView.enableReferenceAxisFrame = YES;
    
    
    self.graphView.enableBezierCurve = YES;
    
    // Set the graph's animation style to draw, fade, or none
    self.graphView.animationGraphStyle = BEMLineAnimationDraw;
    
    // Dash the y reference lines
    self.graphView.lineDashPatternForReferenceYAxisLines = @[@(2),@(2)];
    
    [self.scrollView addSubview:self.graphView];
}

#pragma mark - BEMSimpleLineGraphView
-(NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph{
    return self.numbers.count;
}

-(CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index{
    return [self.numbers[index] floatValue];
}

-(NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(BEMSimpleLineGraphView *)graph{
    return 0.1;
}

-(NSString *)lineGraph:(BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%i", [self.years[index] intValue]];
}

@end
