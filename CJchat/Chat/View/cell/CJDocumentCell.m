//
//  CJDocumentCell.m
//  CJchat
//
//  Created by CoderChenJun on 16/7/22.
//  Copyright © 2016年 zwu All rights reserved.
//

#import "CJDocumentCell.h"
#import "CJFileTool.h"

@interface CJDocumentCell ()

@property (nonatomic, weak) UIImageView *imageV;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *sizeLabel;


@end

@implementation CJDocumentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftFreeSpace = 115;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"docCell";
    CJDocumentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CJDocumentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

// 这里name是拼接后的全称
- (void)setName:(NSString *)name
{
    _name = name;
    
    NSString *type = [name pathExtension];
    NSString *path = [[CJFileTool fileMainPath] stringByAppendingPathComponent:name];
    self.filePath = path;
     
    self.nameLabel.text = [name originName];
    self.sizeLabel.text = [CJFileTool filesize:path];
    NSNumber *num = [CJMessageHelper fileType:type];
    if (num == nil) {
        self.imageV.image = [UIImage imageNamed:@"iconfont-wenjian"];
    } else {
        self.imageV.image = [CJMessageHelper allocationImage:[num intValue]];
    }
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.selectBtn.frame = CGRectMake(15, 30, 20, 20);
    self.imageV.frame    = CGRectMake(55, 15, 50, 50);
    self.nameLabel.frame = CGRectMake(_imageV.right+10, 15, UISCREEN_WIDTH-_imageV.right-10-40, 16);
    [_nameLabel sizeToFit];
    self.sizeLabel.frame = CGRectMake(_imageV.right+10,_imageV.bottom-15 , 100, 15);
    [_sizeLabel sizeToFit];
}


- (void)selectBtnClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(selectBtnClicked:)]) {
        [self.delegate selectBtnClicked:sender];
    }
}

#pragma mark - Getter

- (UIButton *)selectBtn
{
    if (!_selectBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
        _selectBtn = btn;
        [_selectBtn setImage:[UIImage imageNamed:@"App_select_dis"] forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"App_select"] forState:UIControlStateSelected];
        [_selectBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}

- (UIImageView *)imageV
{
    if (!_imageV) {
        UIImageView *imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        _nameLabel = label;
        _nameLabel.font = [UIFont systemFontOfSize:15.0];
        _nameLabel.numberOfLines = 2;
        _nameLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _nameLabel.textColor = CJHexColor(0x000000);
    }
    return _nameLabel;
}

- (UILabel *)sizeLabel
{
    if (!_sizeLabel) {
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        _sizeLabel = label;
        _sizeLabel.font = [UIFont systemFontOfSize:11.0];
        _sizeLabel.textColor = CJHexColor(0x7e7e7e);
    }
    return _sizeLabel;
}


@end
