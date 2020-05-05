//
//  ItemFactory.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/30/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

import Foundation

class ItemFactory {
    
    // we use enums to keep track of indexes of stats in the item arrays
    init() {
    }
    
    
    enum HEAL_POTION : Int{
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case STAT = 3
        case AMOUNT = 4
    }
    
    let healPotionStats = [
        ["Small Hp Potion", 0 , "Heals a little", "health", 10],
        ["Medium Hp Potion", 0 , "Heals a good amount", "health", 50],
        ["Large Hp Potion", 0 , "Heals a lot", "health", 100]
    ]
    
    /*
    enum PERM_POTION : Int{
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case STAT = 3
        case AMOUNT = 4
    }
    
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
    
    enum TEMP_POTION : Int {
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case STAT = 3
        case AMOUNT = 4
        case DURATION = 5
    }
    
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
    ]*/
    
    enum SWORD : Int {
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case GRADE = 3
        case ATTACK = 4
        case LUCK = 5
    }
    
    let swordStats = [
        ["Stick", 0, "A old stick", "scrap", 1 , 1],
        ["Sharpen Bat", 0, "A old sword", "uncommon", 4, 4],
        ["Rusty Knight's Sword", 0, "A knight's sword", "rare", 10 , 10],
        ["Lighting Blade", 0, "A blade of lighting", "mythic", 30 , 30],
        ["Excalibur", 0, "The King's choice of weaponry", "legendary", 100 , 100]
    ]
    
    enum CHEST_PIECE : Int {
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case GRADE = 3
        case HEALTH = 4
        case DEFENSE = 5
    }
    
    let chestPieceStats = [
        ["Leather Coat", 0, "A old leather coat", "scrap", 1 , 1],
        ["Chain Mail", 0, "A old rusty chain mail", "uncommon", 4, 4],
        ["Rusty Knight's Chestpiece", 0, "A knight's chestpiece", "rare", 10 , 10],
        ["Golden Fleece", 0, "A golden fleece", "mythic", 30 , 30],
        ["Author's chestpiece", 0, "The King's choice for an chestpieces", "legendary", 100 , 100]
    ]
    
    enum HELMET : Int {
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case GRADE = 3
        case HEALTH = 4
        case DEFENSE = 5
    }
    
    let helmetStats = [
        ["Bowl", 0, "A broken bowl", "scrap", 1 , 1],
        ["Miners Helmet", 0, "A old miner's helmet", "uncommon", 4, 4],
        ["Rusty Knight's Helmet", 0, "A knight's helmet", "rare", 10 , 10],
        ["Barbarian King Helmet", 0, "A helmet from the last known Barbarian King", "mythic", 30 , 30],
        ["Author's helmet", 0, "The King's choice for an helmet", "legendary", 100 , 100]
    ]
    
    enum BOOT : Int{
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case GRADE = 3
        case HEALTH = 4
        case DEFENSE = 5
    }
    
    let bootStats = [
        ["Ripped Socks", 0, "A broken bowl", "scrap", 1 , 1],
        ["Miners Boots", 0, "A old miner's boots", "uncommon", 4, 4],
        ["Rusty Knight's Boots", 0, "A knight's boots", "rare", 10 , 10],
        ["Flash's shoes", 0, "A old shoe from the flash", "mythic", 30 , 30],
        ["Author's boots", 0, "The King's choice for an boots", "legendary", 100 , 100]
    ]
    
    enum GLOVES : Int {
        case NAME = 0
        case PRICE = 1
        case DESCRIPTION = 2
        case GRADE = 3
        case HEALTH = 4
        case DEFENSE = 5
        case LUCK = 6
    }
    
    let glovesStats = [
        ["Ripped mittins", 0, "A broken bowl", "scrap", 1 , 1, 1],
        ["Miners gloves", 0, "A old miner's boots", "uncommon", 4, 4, 4],
        ["Rusty Knight's Gauntlet", 0, "A knight's helemt", "rare", 10 , 10, 10],
        ["Kan's Gaunlets", 0, "The gauntlet the legend Kan had", "mythic", 30 , 30, 30],
        ["Author's Gauntlets", 0, "The King's choice for an boots", "legendary", 100 , 100, 100]
    ]
    
    
    
    func produceItem(name : String, type: String) -> GameItem? {
        /*else if (type == "perm_potion") {
            item = PernamentPotion(name: permPotionStats[index][PERM_POTION.NAME.rawValue] as! String, price: permPotionStats[index][PERM_POTION.PRICE.rawValue] as! Int, description: permPotionStats[index][PERM_POTION.DESCRIPTION.rawValue] as! String, stat: permPotionStats[index][PERM_POTION.STAT.rawValue] as! String, amount: permPotionStats[index][PERM_POTION.AMOUNT.rawValue] as! Int)
        } else if (type == "temp_potion") {
            item = TemporaryPotion(name: tempPotionStats[index][TEMP_POTION.NAME.rawValue] as! String, price: tempPotionStats[index][TEMP_POTION.PRICE.rawValue] as! Int, description: tempPotionStats[index][TEMP_POTION.DESCRIPTION.rawValue] as! String, stat: tempPotionStats[index][TEMP_POTION.STAT.rawValue] as! String, amount: tempPotionStats[index][TEMP_POTION.AMOUNT.rawValue] as! Int, turns: tempPotionStats[index][TEMP_POTION.DURATION.rawValue] as! Int)
        } */
        var item : GameItem? = nil
        var itemStats : [[Any]]
        
        if (type == "heal_potion") {
            itemStats = healPotionStats
        }/* else if (type == "perm_potion") {
            itemStats = permPotionStats
        } else if (type == "temp_potion") {
            itemStats = tempPotionStats
        }*/ else if (type == "helmet") {
            itemStats = helmetStats
        } else if (type == "gloves") {
            itemStats = glovesStats
        } else if (type == "boot") {
            itemStats = bootStats
        } else if (type == "sword") {
            itemStats = swordStats
        } else if (type == "chest_piece") {
            itemStats = chestPieceStats
        } else {
            return nil
        }
        
        let index = findIndex(itemName: name, itemStats: itemStats)
        
        if (index == -1 ) {
            return nil
        }
        
        if (type == "heal_potion") {
            item = HealPotion(name: healPotionStats[index][HEAL_POTION.NAME.rawValue] as! String, price: healPotionStats[index][HEAL_POTION.PRICE.rawValue] as! Int, description: healPotionStats[index][HEAL_POTION.DESCRIPTION.rawValue] as! String, amount: healPotionStats[index][HEAL_POTION.AMOUNT.rawValue] as! Int)
        } else if (type == "helmet") {
            item = Helmet(name: helmetStats[index][HELMET.NAME.rawValue] as! String, price: helmetStats[index][HELMET.PRICE.rawValue] as! Int, description:  helmetStats[index][HELMET.DESCRIPTION.rawValue] as! String, rarity:  helmetStats[index][HELMET.GRADE.rawValue] as! String, health: helmetStats[index][HELMET.HEALTH.rawValue] as! Int, defense: helmetStats[index][HELMET.DEFENSE.rawValue] as! Int)
        } else if (type == "gloves") {
            /*
            item = Gloves(name: glovesStats[index][GLOVES.NAME.rawValue] as! String, price: glovesStats[index][GLOVES.PRICE.rawValue] as! Int, description:  glovesStats[index][GLOVES.DESCRIPTION.rawValue] as! String, rarity:  glovesStats[index][GLOVES.GRADE.rawValue] as! String, health: glovesStats[index][GLOVES.HEALTH.rawValue] as! Int, defense: glovesStats[index][GLOVES.DEFENSE.rawValue] as! Int, luck: glovesStats[index][GLOVES.LUCK.rawValue] as! Int)*/
            item = Gloves(name: glovesStats[index][GLOVES.NAME.rawValue] as! String, price: glovesStats[index][GLOVES.PRICE.rawValue] as! Int, description: glovesStats[index][GLOVES.DESCRIPTION.rawValue] as! String, rarity: glovesStats[index][GLOVES.GRADE.rawValue] as! String, health: glovesStats[index][GLOVES.HEALTH.rawValue] as! Int, defense: glovesStats[index][GLOVES.DEFENSE.rawValue] as! Int, luck: glovesStats[index][GLOVES.LUCK.rawValue] as! Int)
           
        } else if (type == "boot") {
            item = Boot(name: bootStats[index][BOOT.NAME.rawValue] as! String, price: bootStats[index][BOOT.PRICE.rawValue] as! Int, description:  bootStats[index][BOOT.DESCRIPTION.rawValue] as! String, rarity:  bootStats[index][BOOT.GRADE.rawValue] as! String, health: bootStats[index][BOOT.HEALTH.rawValue] as! Int, defense: bootStats[index][BOOT.DEFENSE.rawValue] as! Int)
        } else if (type == "sword") {
            item = Sword(name: swordStats[index][SWORD.NAME.rawValue] as! String, price: swordStats[index][SWORD.PRICE.rawValue] as! Int, description: swordStats[index][SWORD.DESCRIPTION.rawValue] as! String, rarity: swordStats[index][SWORD.GRADE.rawValue] as! String, attack: swordStats[index][SWORD.ATTACK.rawValue] as! Int, luck: swordStats[index][SWORD.LUCK.rawValue] as! Int)
        } else if (type == "chest_piece") {
            item = ChestPiece(name: chestPieceStats[index][CHEST_PIECE.NAME.rawValue] as! String, price: chestPieceStats[index][CHEST_PIECE.PRICE.rawValue] as! Int, description:  chestPieceStats[index][CHEST_PIECE.DESCRIPTION.rawValue] as! String, rarity:  chestPieceStats[index][CHEST_PIECE.GRADE.rawValue] as! String, health: chestPieceStats[index][CHEST_PIECE.HEALTH.rawValue] as! Int, defense: chestPieceStats[index][CHEST_PIECE.DEFENSE.rawValue] as! Int)
        }
        return item
    }
    
    
    func findIndex(itemName: String, itemStats: [[Any]]) -> Int {
        for num in 0 ... itemStats.count - 1 {
            if (itemStats[num][0] as! String == itemName) {
                return num
            }
        }
        return -1
    }
}



