//
//  MenuLangCollectionViewCell.m
//  CZA
//
//  Created by Arkalyk Akash on 6/11/16.
//  Copyright © 2016 Arkalyk Akash. All rights reserved.
//
#import "UIColor+UIColor_CustomColorCategory.h"
#import "MenuLangCollectionViewCell.h"
#import "MenuCollectionViewCell.h"
#import "MainMenuCellView.h"
#import "ViewController.h"

static NSString *currentLanguage;

@implementation MenuLangCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        int languageFontSize;
        int menuItemsFontSize;
        int btnRectWidth;
        if (self.contentView.frame.size.width == 320) {
            languageFontSize = 16;
            menuItemsFontSize = 15;
            btnRectWidth = 100;
        }else{
            languageFontSize = 20;
            menuItemsFontSize = 17;
            btnRectWidth = 115;
        }
        
        
        self.buttons = [NSMutableArray arrayWithCapacity:2];
        
        float logoWidth = self.contentView.frame.size.height*0.2;
        
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width/2-logoWidth/2, self.contentView.frame.size.height*0.085, logoWidth, logoWidth)];
        self.logoImageView.image = [UIImage imageNamed:@"ColorfullLogo.png"];
        [self.contentView addSubview:self.logoImageView];
        
        self.chooseLanguageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height*0.3, self.contentView.frame.size.width, 40)];
        self.chooseLanguageLabel.text = @"Тілді Таңдаңыз / Выберите Язык";
        self.chooseLanguageLabel.textColor = [UIColor whiteColor];
        self.chooseLanguageLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:languageFontSize];
        self.chooseLanguageLabel.textAlignment = NSTextAlignmentCenter;
        self.chooseLanguageLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.chooseLanguageLabel];
        
        
        CGRect btnRect = CGRectMake(self.contentView.frame.size.width/2-50, self.contentView.frame.size.height*0.4, btnRectWidth, 30);
        
        self.rButton1 = [[RadioButton alloc] initWithFrame:btnRect];
        //[self.rButton1 addTarget:self action:@selector(onRadioButtonValueChanged:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.y += 40;
        [self.rButton1 setTitle:@"Қазақ" forState:UIControlStateNormal];
        [self.rButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rButton1.titleLabel.font = [UIFont boldSystemFontOfSize:languageFontSize];
        [self.rButton1 setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [self.rButton1 setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        self.rButton1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.rButton1.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [self.buttons addObject:self.rButton1];
        [self.contentView addSubview:self.rButton1];
        
        self.rButton2 = [[RadioButton alloc] initWithFrame:btnRect];
        //[self.rButton2 addTarget:self action:@selector(onRadioButtonValueChanged:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.y += 40;
        [self.rButton2 setTitle:@"Русский" forState:UIControlStateNormal];
        [self.rButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rButton2.titleLabel.font = [UIFont boldSystemFontOfSize:languageFontSize];
        [self.rButton2 setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
        [self.rButton2 setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
        self.rButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.rButton2.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [self.buttons addObject:self.rButton2];
        [self.contentView addSubview:self.rButton2];
        
        [self.buttons[0] setGroupButtons:self.buttons]; // Setting buttons into the group
        [self.buttons[0] setSelected:YES];
        
        float buttonWidth = self.contentView.frame.size.width*0.6;
        self.confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width/2-buttonWidth/2, CGRectGetMaxY(self.rButton2.frame)+20, buttonWidth, 44)];
        self.confirmButton.backgroundColor = [UIColor whiteColor];
        [self.confirmButton setTitle:@"Растау/Подтвердить" forState:UIControlStateNormal];
        [self.confirmButton setTitleColor:[UIColor customBlue4] forState:UIControlStateNormal];
        self.confirmButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:languageFontSize];
        self.confirmButton.layer.cornerRadius = 10;
        [self.contentView addSubview:self.confirmButton];
        
        self.imageNames = [[NSMutableArray alloc] init];
        [self.imageNames addObject:@"vacancies.png"];
        [self.imageNames addObject:@"test.png"];
        [self.imageNames addObject:@"events.png"];
        [self.imageNames addObject:@"contacts.png"];
        [self.imageNames addObject:@"help1.png"];
        [self.imageNames addObject:@"help2.png"];
        [self.imageNames addObject:@"about.png"];
        [self.imageNames addObject:@"settings.png"];
        
        self.categoryNames = [[NSMutableArray alloc] init];
        [self.categoryNames addObject:@"Вакансии"];
        [self.categoryNames addObject:@"Проф-тест"];
        [self.categoryNames addObject:@"Афиша"];
        [self.categoryNames addObject:@"Контакты"];
        [self.categoryNames addObject:@"Соискателям"];
        [self.categoryNames addObject:@"Работадателям"];
        [self.categoryNames addObject:@"О проекте"];
        [self.categoryNames addObject:@"Настройки"];
        
        self.categoryNamesKaz = [[NSMutableArray alloc] init];
        [self.categoryNamesKaz addObject:@"Бос жұмыс орындары"];
        [self.categoryNamesKaz addObject:@"Проф-тест"];
        [self.categoryNamesKaz addObject:@"Афиша"];
        [self.categoryNamesKaz addObject:@"Байланыс ақпараты"];
        [self.categoryNamesKaz addObject:@"Жұмыс іздеушілерге"];
        [self.categoryNamesKaz addObject:@"Жұмыс берушілерге"];
        [self.categoryNamesKaz addObject:@"Жоба туралы"];
        [self.categoryNamesKaz addObject:@"Баптаулар"];
        
        self.identifierNames = [[NSMutableArray alloc] init];
        [self.identifierNames addObject:@"Vacancies"];
        [self.identifierNames addObject:@"Test"];
        [self.identifierNames addObject:@"Events"];
        [self.identifierNames addObject:@"Contacts"];
        [self.identifierNames addObject:@"Info for employees"];
        [self.identifierNames addObject:@"Info for employers"];
        [self.identifierNames addObject:@"About"];
        [self.identifierNames addObject:@"About"];
        
        self.colors = [[NSMutableArray alloc] init];
        [self.colors addObject:[UIColor customBlue2]];
        [self.colors addObject:[UIColor customBlue1]];
        [self.colors addObject:[UIColor customBlue3]];
        [self.colors addObject:[UIColor customBlue4]];
        [self.colors addObject:[UIColor customBlue5]];
        [self.colors addObject:[UIColor customBlue6]];
        [self.colors addObject:[UIColor customBlue7]];
        [self.colors addObject:[UIColor customBlue8]];
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height) collectionViewLayout:flowLayout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        self.collectionView.backgroundColor = [UIColor grayColor];
        //[self.contentView addSubview:self.collectionView];
        
        float y = 0;
        int colorIndex = 0;
        float height = self.contentView.frame.size.height-30;
        self.menuItems = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 4; i++) {
            MainMenuCellView *cellView1 = [[MainMenuCellView alloc] initWithFrame:CGRectMake(0, y, self.contentView.frame.size.width/2, height/4)];
            cellView1.backgroundColor = self.colors[colorIndex];
            cellView1.imageView.image = [UIImage imageNamed:self.imageNames[colorIndex]];
            cellView1.nameLabel.text = self.categoryNames[colorIndex];
            cellView1.nameLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:menuItemsFontSize];
            [self.menuItems addObject:cellView1];
            
            MainMenuCellView *cellView2 = [[MainMenuCellView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cellView1.frame), y, self.contentView.frame.size.width/2, height/4)];
            cellView2.backgroundColor = self.colors[colorIndex+1];
            cellView2.imageView.image = [UIImage imageNamed:self.imageNames[colorIndex+1]];
            cellView2.nameLabel.text = self.categoryNames[colorIndex+1];
            cellView2.nameLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:menuItemsFontSize];
            [self.menuItems addObject:cellView2];
            
            [self.contentView addSubview:cellView1];
            [self.contentView addSubview:cellView2];
            y += height/4;
            colorIndex += 2;
        }
        
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

#pragma mark - Getters
+(NSString *)getCurrentLanguage{
    return currentLanguage;
}

#pragma mark - Helper methods
-(void)changeLang{
    [self.categoryNames addObject:@"Вакансии"];
    [self.categoryNames addObject:@"Тест"];
    [self.categoryNames addObject:@"Мероприятия"];
    [self.categoryNames addObject:@"Контакты"];
    [self.categoryNames addObject:@"Советы работникам"];
    [self.categoryNames addObject:@"Советы работадателям"];
    [self.categoryNames addObject:@"О проекте"];
    [self.categoryNames addObject:@"Настройки"];
}

#pragma mark - CollectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageNames.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:self.imageNames[indexPath.row]];
    if ([currentLanguage isEqualToString:@"Russian"]) {
        cell.nameLabel.text = self.categoryNames[indexPath.row];
    }else{
        cell.nameLabel.text = self.categoryNamesKaz[indexPath.row];
    }
    cell.backgroundColor = self.colors[indexPath.row];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width/2, (collectionView.frame.size.height-30)/4);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *VC = (ViewController *)[self getViewController];
    if ([self.identifierNames[indexPath.row] isEqualToString:@"Info for employers"]) {
        VC.isEmployer = YES;
        [VC performSegueWithIdentifier:@"helpfulInfo" sender:VC];
    }else if([self.identifierNames[indexPath.row] isEqualToString:@"Info for employees"]){
        VC.isEmployer = NO;
        [VC performSegueWithIdentifier:@"helpfulInfo" sender:VC];
    }else if(indexPath.row == 7){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [VC.pagingCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }else{
        [VC performSegueWithIdentifier:self.identifierNames[indexPath.row] sender:VC];
    }
}

-(void) onRadioButtonValueChanged:(RadioButton*)sender
{
    // Lets handle ValueChanged event only for selected button, and ignore for deselected
    if(sender.selected) {
        if ([sender.titleLabel.text isEqualToString:@"Қазақ"]) {
            currentLanguage = @"Kazakh";
        }else{
            currentLanguage = @"Russian";
        }
        NSLog(@"%@", sender.titleLabel.text);
        
    }
}

- (UIViewController *)getViewController
{
    id vc = [self nextResponder];
    while(![vc isKindOfClass:[UIViewController class]] && vc!=nil)
    {
        vc = [vc nextResponder];
    }
    
    return vc;
}


@end
