#import "QuestionCollectionViewCell.h"
#import "TestResultsGenerator.h"
#import "TestViewController.h"
#import "UIColor+CZColor.h"
#import "TestResults.h"
#import "Question.h"

@interface TestViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UILabel *questionNumberLabel;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UITextView *questionTextView;
@property (nonatomic) UIButton *optionButton1;
@property (nonatomic) UIButton *optionButton2;
@property (nonatomic) UIButton *optionButton3;
@property (nonatomic) UIButton *optionButton4;
@property (nonatomic) UIProgressView *progressView;
@property (nonatomic) NSMutableArray *questionsFromBackend;
@property (nonatomic) NSArray *questions;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) int indexOfQuestion;
@property (nonatomic) double progress;

@property (nonatomic) NSMutableArray *testResults;
@property (nonatomic) NSMutableArray *letterOptions;
@property (nonatomic) NSMutableArray *usersResponse;
@property (nonatomic) NSMutableArray *testResultsObjects;

@property (nonatomic) NSString *testResultsText;

@end

@implementation TestViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //if ([[ViewController getCurrentLanguage] isEqualToString:@"Russian"]) {
      //  self.navigationItem.title = @"Тест на профориентацию";
    //}else{
      //  self.navigationItem.title = @"Кәсіптік бағдар бойынша тест";
    //}
    
    self.navigationItem.title = @"Кәсіптік бағдар бойынша тест";
    
    self.testResultsObjects = [[NSMutableArray alloc] init];
    self.testResultsObjects = [TestResultsGenerator getTestResults];
    
    self.testResults = [[NSMutableArray alloc] init];
    self.usersResponse = [[NSMutableArray alloc] init];
    self.letterOptions = [NSMutableArray arrayWithObjects:@"E", @"I", @"S", @"N", @"T", @"F", @"J", @"P", nil];
    
    UIView *gradientView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = gradientView.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor customBlue7] CGColor], (id)[[UIColor customBlue2] CGColor], nil];
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    
    self.indexOfQuestion = 0;
    self.questions = [[NSArray alloc] init];
    self.questionsFromBackend = [[NSMutableArray alloc] init];
    
    [self drawCollectionView];
    
    int imageWidth = self.view.frame.size.width*0.6;
    int distFromTop = 160;
    if (self.view.frame.size.height == 480) {
        distFromTop = 120;
    }
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-imageWidth/2, distFromTop, imageWidth, 10)];
    [self.progressView setTrackTintColor:[UIColor customDarkBlue1]];
    [self.progressView setTintColor:[UIColor customBlue2]];
    self.progressView.progress = self.progress/[self.questions count];
    
    [self.progressView setTransform:CGAffineTransformMakeScale(1.0, 4.0)];
    
    [self.view addSubview:self.progressView];
    self.progressView.hidden = YES;
    
    //[self getAllEntitysAsync];
    // Do any additional setup after loading the view.
}

-(void)drawCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[QuestionCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.scrollEnabled = NO;
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - Helper methods
-(void)showTestResults{
    NSString *currentTestResults = [[self.testResults valueForKey:@"description"] componentsJoinedByString:@""];
    NSLog(@"\n\n\n\n\n results!!! %@ \n\n\n", currentTestResults);
    for (TestResults *tR in self.testResultsObjects) {
        if ([tR.letterCombination isEqualToString:currentTestResults]) {
            //if ([[ViewController getCurrentLanguage] isEqualToString:@"Russian"]) {
              //  self.testResultsText = tR.resultsTextRus;
            //}else{
                self.testResultsText = tR.resultsTextKaz;
            //}
            [self.collectionView reloadData];
            break;
        }
    }
}

#pragma mark - IBAction
-(IBAction)optionSelected:(UIButton *)sender{
    Question *q = self.questions[self.indexOfQuestion];
    NSLog(@"index is %i", self.indexOfQuestion);
    if (sender.tag == 1) {
        [self.usersResponse addObject:q.option1Letter];
    }else if(sender.tag == 2){
        [self.usersResponse addObject:q.option2Letter];
    }
    
    if (self.indexOfQuestion != [self.questions count]) {
        self.indexOfQuestion++;
    }
    if (self.indexOfQuestion == [self.questions count]) {
        self.progressView.hidden = YES;
        for (int j = 0; j < (int)self.letterOptions.count; j++) {
            int count = 0;
            for (int i = 0; i < (int)self.usersResponse.count; i++) {
                if ([self.letterOptions[j] isEqualToString:self.usersResponse[i]]) {
                    count++;
                }
            }
            if (count >= 2) {
                [self.testResults addObject:self.letterOptions[j]];
            }
        }
        [self showTestResults];
    }
    
    self.progress++;
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.indexOfQuestion inSection:0];
    [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.progressView.progress = self.progress/[self.questions count];
}


#pragma mark - Collectionview delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([self.questions count] != 0) {
        return [self.questions count]+1;
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QuestionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (indexPath.row == [collectionView numberOfItemsInSection:0]-1) {
        cell.questionNumberLabel.hidden = YES;
        cell.questionTextView.hidden = YES;
        cell.optionButton1.hidden = YES;
        cell.optionButton2.hidden = YES;
        cell.optionTextView1.hidden = YES;
        cell.optionTextView2.hidden = YES;
        cell.resultsTextView.hidden = NO;
        cell.resultsTextView.editable = NO;
        cell.resultsTextView.text = self.testResultsText;
        
        //cell.resultsTextView.text = self.testResultsText;
    }else{
        cell.resultsTextView.hidden = YES;
        Question *question = self.questions[indexPath.row];
        
        //if ([[ViewController getCurrentLanguage] isEqualToString:@"Russian"]) {
          //  cell.questionTextView.text = @"Выберите один ответ";
            //cell.optionTextView1.text = question.optionRus1;
            //cell.questionNumberLabel.text = [NSString stringWithFormat:@"%i вопрос", (int)indexPath.row+1];
        //}else{
            cell.questionTextView.text = @"Бір жауап тандаңыз";
            cell.optionTextView1.text = question.optionKaz1;
            cell.questionNumberLabel.text = [NSString stringWithFormat:@"%i сұрақ", (int)indexPath.row+1];
        //}
        
        [cell.optionTextView1 sizeToFit];
        float lineSpace = cell.frame.size.width*0.05;
        cell.optionTextView1.frame = CGRectMake(lineSpace, CGRectGetMinY(cell.optionTextView1.frame), cell.frame.size.width-lineSpace*2, cell.optionTextView1.frame.size.height);
        cell.optionButton1.frame = cell.optionTextView1.frame;
        cell.optionButton1.tag = 1;
        
        //if ([[ViewController getCurrentLanguage] isEqualToString:@"Russian"]) {
            cell.optionTextView2.text = question.optionRus2;
        //}else{
            cell.optionTextView2.text = question.optionKaz2;
        //}
        
        [cell.optionTextView2 sizeToFit];
        cell.optionTextView2.frame = CGRectMake(lineSpace, CGRectGetMaxY(cell.optionTextView1.frame)+20, cell.frame.size.width-lineSpace*2, cell.optionTextView2.frame.size.height);
        cell.optionButton2.frame = cell.optionTextView2.frame;
        cell.optionButton2.tag = 2;
        
        [cell.optionButton1 addTarget:self action:@selector(optionSelected:) forControlEvents:UIControlEventTouchUpInside];
        [cell.optionButton2 addTarget:self action:@selector(optionSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
