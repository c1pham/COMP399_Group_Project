//
//  ItemFactory.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/30/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation
/*
class ItemFactory {
    
    // we use enums to keep track of indexes of stats in the item arrays
    
    
    
    /*
    weak enum HEAL_POTION {
        case NAME
        case PRICE
        case DESCRIPTION
        case STAT
        case AMOUNT
    }*/
    
    let healPotionStats = [
        ["Small Hp Potion", 0 , "Heals a little", "health", 10],
        ["Small Hp Potion", 0 , "Heals a good amount", "health", 50],
        ["Small Hp Potion", 0 , "Heals a lot", "health", 10]
    ]
    
    /*
    weak enum PERM_POTION {
        case NAME
        case PRICE
        case DESCRIPTION
        case STAT
        case AMOUNT
    }*/
    
    let permPotionStats = [
        ["Small HP Boost Potion", 0 , "Pernamently Increase HP", "health", 10],
        ["Small Attack Boost Potion", 0 , "Pernamently Increase HP", "attack", 10],
        ["Small Defense Boost Potion", 0 , "Pernamently Increase HP", "defense", 10],
        ["Small Luck HP Boost Potion", 0 , "Pernamently Increase HP", "luck", 10],
        ["Medium HP Boost Potion", 0 , "Pernamently Increase HP", "health", 30],
        ["Medium Attack Boost Potion", 0 , "Pernamently Increase HP", "attack", 30],
        ["Medium Defense Boost Potion", 0 , "Pernamently Increase HP", "defense", 30],
        ["Medium Luck HP Boost Potion", 0 , "Pernamently Increase HP", "luck", 30],
        ["Large HP Boost Potion", 0 , "Pernamently Increase HP", "health", 100],
        ["Large Attack Boost Potion", 0 , "Pernamently Increase HP", "attack", 100],
        ["Large Defense Boost Potion", 0 , "Pernamently Increase HP", "defense", 100],
        ["Large Luck HP Boost Potion", 0 , "Pernamently Increase HP", "luck", 100]
    ]
    /*
    weak enum TEMP_POTION {
        case NAME
        case PRICE
        case DESCRIPTION
        case STAT
        case AMOUNT
        case DURATION
    }*/
    
    let tempPotionStats = [
        ["Small Temporary HP Boost Potion", 0 , "Pernamently Increase HP", "health", 10],
        ["Small Temporary Attack Boost Potion", 0 , "Pernamently Increase HP", "attack", 10],
        ["Small Temporary Defense Boost Potion", 0 , "Pernamently Increase HP", "defense", 10],
        ["Small Temporary Luck HP Boost Potion", 0 , "Pernamently Increase HP", "luck", 10],
        ["Medium Temporary HP Boost Potion", 0 , "Pernamently Increase HP", "health", 30],
        ["Medium Temporary Attack Boost Potion", 0 , "Pernamently Increase HP", "attack", 30],
        ["Medium Temporary Defense Boost Potion", 0 , "Pernamently Increase HP", "defense", 30],
        ["Medium Temporary Luck HP Boost Potion", 0 , "Pernamently Increase HP", "luck", 30],
        ["Large Temporary HP Boost Potion", 0 , "Pernamently Increase HP", "health", 100],
        ["Large Temporary Attack Boost Potion", 0 , "Pernamently Increase HP", "attack", 100],
        ["Large Temporary Defense Boost Potion", 0 , "Pernamently Increase HP", "defense", 100],
        ["Large Temporary Luck HP Boost Potion", 0 , "Pernamently Increase HP", "luck", 100]
    ]
    
    weak enum SWORD {
        case NAME
        case PRICE
        case DESCRIPTION
        case GRADE
        case ATTACK
        case LUCK
    }
    
    let swordStats = [
        ["Stick", 0, "A old stick", "scrap", 1 , 1],
        ["Sharpen Bat", 0, "A old sword", "uncommon", 4, 4],
        ["Rusty Knight's Sword", 0, "A knight's sword", "rare", 10 , 10],
        ["Lighting Blade", 0, "A blade of lighting", "mythic", 30 , 30],
        ["Excalibur", 0, "The King's choice of weaponry", "legendary", 100 , 100]
        
    ]
    
    weak enum CHEST_PIECE {
        case NAME
        case PRICE
        case DESCRIPTION
        case GRADE
        case HEALTH
        case DEFENSE
    }
    
    let chestPieceStats = [
        ["Leather Coat", 0, "A old leather coat", "scrap", 1 , 1],
        ["Chain Mail", 0, "A old rusty chain mail", "uncommon", 4, 4],
        ["Rusty Knight's Chestpiece", 0, "A knight's chestpiece", "rare", 10 , 10],
        ["Golden Fleece", 0, "A golden fleece", "mythic", 30 , 30],
        ["Author's chestpiece", 0, "The King's choice for an chestpieces", "legendary", 100 , 100]
    ]
    
    weak enum HELEMET {
        case NAME
        case PRICE
        case DESCRIPTION
        case GRADE
        case HEALTH
        case DEFENSE
    }
    
    let helmetStats = [
        ["Bowl", 0, "A broken bowl", "scrap", 1 , 1],
        ["Miners Helmet", 0, "A old miner's helmet", "uncommon", 4, 4],
        ["Rusty Knight's Helmet", 0, "A knight's helmet", "rare", 10 , 10],
        ["Barbarian King Helmet", 0, "A helmet from the last known Barbarian King", "mythic", 30 , 30],
        ["Author's helmet", 0, "The King's choice for an helmet", "legendary", 100 , 100]
    ]
    
    weak enum BOOT {
        case NAME
        case PRICE
        case DESCRIPTION
        case GRADE
        case HEALTH
        case DEFENSE
    }
    
    let bootStats = [
        ["Ripped Socks", 0, "A broken bowl", "scrap", 1 , 1],
        ["Miners Boots", 0, "A old miner's boots", "uncommon", 4, 4],
        ["Rusty Knight's Boots", 0, "A knight's boots", "rare", 10 , 10],
        ["Flash's shoes", 0, "A old shoe from the flash", "mythic", 30 , 30],
        ["Author's boots", 0, "The King's choice for an boots", "legendary", 100 , 100]
    ]
    
    weak enum GLOVES {
        case NAME
        case PRICE
        case DESCRIPTION
        case GRADE
        case HEALTH
        case DEFENSE
        case LUCK
    }
    
    let glovesStats = [
        ["Ripped mittins", 0, "A broken bowl", "scrap", 1 , 1],
        ["Miners gloves", 0, "A old miner's boots", "uncommon", 4, 4],
        ["Rusty Knight's Gauntlet", 0, "A knight's helemt", "rare", 10 , 10],
        ["Kan's Gaunlets", 0, "The gauntlet the legend Kan had", "mythic", 30 , 30],
        ["Author's Gauntlets", 0, "The King's choice for an boots", "legendary", 100 , 100]
    ]
    
    
    
    func produceItem(name : String, type: String) -> Item? {
        var item : Item? = nil
        if (type.lowercased() == "healpotion") {
            item = HealPotion(name: String(healPotionStats[HEAL_POTION.NAME]), price: Int(healPotionStats[HEAL_POTION.PRICE]), description: String(healPotionStats[HEAL_POTION.DESCRIPTION]), amount: Int(healPotionStats[HEAL_POTION.AMOUNT]))
        } else if (type.lowercased() == "temppotion") {
            item = TemporaryPotion(name: String(tempPotionStats[TEMP_POTION.NAME]), price: Int(tempPotionStats[TEMP_POTION.PRICE]), description: String(tempPotionStats[TEMP_POTION.DESCRIPTION]), stat: String(tempPotionStats[TEMP_POTION.STAT]), amount: Int(tempPotionStats[TEMP_POTION.AMOUNT]), turns: Int(tempPotionStats[TEMP_POTION.DURATION]))
            
        } else if (type.lowercased() == "permpotion") {
            
        }
        return item
    }
    
    func findIndex(itemName: String, itemStats: [[Any]]) -> Int {
        for num in 0 ... itemStats.count {
            if (itemStats[num][0] as! String == itemName) {
                return num
            }
        }
        return -1
    }
}




var factory = ItemFactory()

factory.findIndex(itemName : "Medium Hp Potion", itemStats: factory.healPotionStats)


*/
