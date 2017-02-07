//
// Created by Fabien Warniez on 2015-02-01.
// Copyright (c) 2015 Fabien Warniez. All rights reserved.
//

@class FWPatternModel;
@class FWColorSchemeModel;
@class FWLockPatternCollectionViewCell;

@protocol FWLockPatternCollectionViewCellDelegate <NSObject>

- (void)playButtonTappedFor:(FWLockPatternCollectionViewCell *)patternCollectionViewCell;
- (void)favouriteButtonTappedFor:(FWLockPatternCollectionViewCell *)patternCollectionViewCell;
- (void)unfavouriteButtonTappedFor:(FWLockPatternCollectionViewCell *)patternCollectionViewCell;
- (void)patternCollectionViewCellDidCancel:(FWLockPatternCollectionViewCell *)patternCollectionViewCell;

@end

@interface FWLockPatternCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<FWLockPatternCollectionViewCellDelegate> delegate;
@property (nonatomic, strong) UIColor *mainColor;
@property (nonatomic, strong) FWPatternModel *cellPattern;
@property (nonatomic, strong) FWColorSchemeModel *colorScheme;
@property (nonatomic, assign) BOOL fitsOnCurrentBoard;

+ (CGFloat)titleBarHeight;

@end
