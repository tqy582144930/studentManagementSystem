//
//  addTableViewCell.m
//  ios学生管理系统
//
//  Created by tuqiangyao on 2018/8/7.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "addTableViewCell.h"

@implementation addTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLable = [[UILabel alloc] init];
        _nameLable.textColor = [UIColor blackColor];
        _nameLable.font = [UIFont systemFontOfSize:15];
        _nameLable.text = @"姓名:";
        [self.contentView addSubview:_nameLable];
        
        self.classLable = [[UILabel alloc] init];
        _classLable.textColor = [UIColor blackColor];
        _classLable.font = [UIFont systemFontOfSize:15];
        _classLable.text = @"班级:";
        [self.contentView addSubview:_classLable];
        
        self.numLable = [[UILabel alloc] init];
        _numLable.textColor = [UIColor blackColor];
        _numLable.font = [UIFont systemFontOfSize:15];
        _numLable.text = @"序号:";
        [self.contentView addSubview:_numLable];
        
        self.ageLable = [[UILabel alloc] init];
        _ageLable.textColor = [UIColor blackColor];
        _ageLable.font = [UIFont systemFontOfSize:15];
        _ageLable.text = @"年龄:";
        [self.contentView addSubview:_ageLable];
        
        self.scoreLable = [[UILabel alloc] init];
        _scoreLable.textColor = [UIColor blackColor];
        _scoreLable.font = [UIFont systemFontOfSize:15];
        _scoreLable.text = @"总成绩:";
        [self.contentView addSubview:_scoreLable];
        
        self.addNameLable = [[UILabel alloc] init];
        _addNameLable.textColor = [UIColor blackColor];
        _addNameLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_addNameLable];
        
        self.addClassLable = [[UILabel alloc] init];
        _addClassLable.textColor = [UIColor blackColor];
        _addClassLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_addClassLable];
        
        self.addNumLable = [[UILabel alloc] init];
        _addNumLable.textColor = [UIColor blackColor];
        _addNumLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_addNumLable];
        
        self.addAgeLable = [[UILabel alloc] init];
        _addAgeLable.textColor = [UIColor blackColor];
        _addAgeLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_addAgeLable];
        
        self.addScoreLable = [[UILabel alloc] init];
        _addScoreLable.textColor = [UIColor blackColor];
        _addScoreLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_addScoreLable];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    _nameLable.frame = CGRectMake(5, 20, 35, 30);
    _classLable.frame = CGRectMake(100, 20, 35, 30);
    _numLable.frame = CGRectMake(190, 20, 35, 30);
    _ageLable.frame = CGRectMake(265, 20, 35, 30);
    _scoreLable.frame = CGRectMake(330, 20, 53, 30);
    
    _addNameLable.frame = CGRectMake(40, 20, 50, 30);
    _addClassLable.frame = CGRectMake(135, 20, 50, 30);
    _addNumLable.frame = CGRectMake(225, 20, 45, 30);
    _addAgeLable.frame = CGRectMake(300, 20, 35, 30);
    _addScoreLable.frame = CGRectMake(383, 20, 35, 30);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
