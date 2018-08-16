//
//  CQClassClusterBaseCell.m
//  iOS_Storage
//
//  Created by 蔡强 on 2018/7/31.
//  Copyright © 2018年 蔡强. All rights reserved.
//

#import "CQClassClusterBaseCell.h"
#import "CQClassClusterCellA.h"
#import "CQClassClusterCellB.h"
#import "CQClassClusterCellC.h"

@implementation CQClassClusterBaseCell

+ (instancetype)cellWithType:(CQClassClusterType)type {
    // 根据type创建对应的子类cell
    switch (type) {
        case CQClassClusterTypeA:
        {
            CQClassClusterCellA *cell = [[CQClassClusterCellA alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CQClassClusterCellAReuseID];
            return cell;
        }
            break;
            
        case CQClassClusterTypeB:
        {
            CQClassClusterCellB *cell = [[CQClassClusterCellB alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CQClassClusterCellBReuseID];
            return cell;
        }
            break;
            
        case CQClassClusterTypeC:
        {
            CQClassClusterCellC *cell = [[CQClassClusterCellC alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CQClassClusterCellCReuseID];
            return cell;
        }
            break;
    }
}

@end
