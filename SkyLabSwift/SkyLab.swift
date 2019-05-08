//
//  SkyLab.swift
//  SkyLabSwift
//
//  Created by snow on 2019/5/8.
//  Copyright © 2019 snow. All rights reserved.
//

import UIKit
import Foundation


class SkyLab: NSObject {
    
    class func randomObjFrom(array : NSArray) -> Any? {
        
        if (array.count == 0){
            return nil
        }
        let idx = Int(arc4random()) % array.count
        return array.object(at: idx)

    }
    
    /// 执行A/B测试
    ///
    /// - Parameters:
    ///   - name: 方案Key
    ///   - A: A方案
    ///   - B: B方案
    class func ABTestWithName(name: String, A : ()->(), B : ()->()) -> Void {
        
        SkyLab.splitTestWithName(name: name, conditions: ["A","B"], block: {choice in
            if (choice as! String == "A"){
                // 执行A方案
                A()
            }else if (choice as! String == "B"){
                // 执行B方案
                B()
            }
        });

    }
    
    /// 恢复历史方案或者从候选方案中选择一个方案
    ///
    /// - Parameters:
    ///   - name: 方案key
    ///   - conditions: 候选方案堆
    ///   - block: 选中方案后的回调
    class func splitTestWithName(name: String, conditions : NSArray, block:(_ choice:Any?)->()) -> Void {
        
        // 查一下历史方案
        var condition = UserDefaults.standard.object(forKey: name)
        
        if (condition == nil || !conditions.contains(condition!)){
            // 没有历史记录，候选数组里面不包含历史记录，那就重新随机选一个
            condition = randomObjFrom(array: conditions)
        }
        
        // 回调
        block(condition);
        // 存储方案
        UserDefaults.standard.set(condition, forKey: name);
       
        
    }
    

    
    
    
    

}
