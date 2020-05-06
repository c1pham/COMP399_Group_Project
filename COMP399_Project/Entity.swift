//
//  Entity.swift
//  COMP399_Project
//
//  Created by Christoper Pham on 4/20/20.
//  Copyright © 2020 Christoper Pham. All rights reserved.
//

/*
Author: Brendan Mendes
Date: 5-6-20
Class: Mobile Application Development

Purpose:
This file contains the classes of all player entities and function to increase their stats and how they react in battle.

Subroutine Purpose:
 Character:
    getName: This will get the name data
    getSprite: This will return the sprite
    getStatHealth: Get health stat
    getStatAttack: Get attack stat
    getStatDefense: Get defense stat
    getCurrentHealth: get current health
    getAttack: Get attack damage
    getDefense: Get a random number of defense base on defense stat
    changeHealth: Adjust health to heal amount or damage
 Player:
    increaseHealth: Will increment health stat
    increaseAttack: Will increment attack stat
    increaseDefense: Will increment defense stat
    increaseLuck: Will increment luck stat
    decreaseHealth: Will decrement health stat
    decreaseAttack: Will decrement attack stat
    decreaseDefense: Will decrement defense stat
    decreaseLuck: Will decrement luck stat
    changeGold: Will change the gold variable by an amount
    getGold: Return the amount of gold
    increaseExp: Increase the number of experience points the character has
    getStatPoint: Will return the stat points layer has
    setStateAmount: Set the value of statPoints
    getAttack: Get attack damage and calculate a chance to crit
    getDefense: Gets defense and incorporates the equipment into defense calculation
 
 spawnEnemy: Creates a random character for player to fight
 
*/

import Foundation

class Character {
    
    var name: String            //Name of Character
    var curHp: Int              //Current Health value of character
    var maxHp: Int              //Max Health value of character
    var level = 1               //Level of Character
    var stats: [Int]            //Stats: [Hp, Att, Def, Lck]
    var sprite: [String]        //Sprite is a string since I don't know how to add a UIImage to this class
    
    //Will be used when the character is created
    init (name: String, stats: [Int], sprite: [String]){
        self.name = name
        self.stats = stats
        self.sprite = sprite
        self.maxHp = stats[0] * 10
        self.curHp = self.maxHp
    }
    
    //Used for enemies that are created
    init(name: String, stats: [Int], sprite: [String], level: Int) {
        self.name = name
        self.stats = stats
        self.sprite = sprite
        self.level = level
        self.maxHp = stats[0] * 10              //Kind of useless for the enemies
        self.curHp = self.maxHp
    }
    
    //Basic Getters for the character
    func getName() -> String{
        return name
    }
    
    func getSprite() -> [String]{
        return sprite
    }
    
    func getStatHealth() -> Int{
        return stats[0]
    }
    
    func getStatAttack() -> Int{
        return stats[1]
    }
    
    func getStatDefense() -> Int{
        return stats[2]
    }
    
    func getStatLuck() -> Int{
        return stats[3]
    }
    
    func getCurrentHealth() -> Int{
        return curHp
    }
    
    // setter for sprite
    func setSprite(_ newSprite: [String]){
        self.sprite = newSprite
    }
    
    //Get certain values
    func getAttack() -> Int{
        let critChance = arc4random_uniform(100)
        if critChance <= stats[3]{
            return stats[1] * 2
        }
        return stats[1]
    }
    
    func getDefense() -> Int{
        return Int(arc4random_uniform(UInt32(stats[2])))
    }
    
    //If attacked, num is positive, if healed num is negative
    func changeHealth(_ num: Int){
        curHp -= num
        if curHp > maxHp{
            curHp = maxHp
        }
    }
}

//Player has different circumstances than an enemy
class Player: Character{

    var curExp = 0              //Current number of experience the player has
    var maxExp = 1            //Max number of exprience the player can have before level up
    var statPoints = 0          //Points available after level up
    var weaponEquip = 0         //No Weapon Equipped
    var armorEquip = [0,0,0,0]  //No Armor Equipped
    var gold = 0                //Amount of gold player has
    
    var armorEquipped = [false,false,false,false]       //Helmet, Chest, Glove, Boots
    var swordEquipped = false;                          //Weapon
    
    
    //When Player levels up
    func levelUp(){
        
        //Refresh Health
        curHp = maxHp
        
        //Make sure that the current Exp is reduced to appropriate amount
        curExp = curExp - maxExp
        
        //Make Max Experience earned more
        maxExp = maxExp + level*level
        
        //Increase number of stats point by 5
        statPoints += 2
        
        //Increase level by one
        level += 1
    }
    
    //Change the vaious stats
    func setStat(_ amt: [Int]){
        for i in 0..<stats.count{
            stats[i] = amt[i]
        }
        maxHp = stats[0] * 10
        curHp = maxHp
    }
    
    //Increase the various stats
    func increaseHealth(){
        stats[0] += 1
        
        //When you increase the health stat, make sure to update the max Hp to new value
        maxHp = stats[0] * 10
        curHp = maxHp
    }
    
    func increaseAttack(){
        stats[1] += 1
    }

    func increaseDefense(){
        stats[2] += 1
    }
    
    func increaseLuck(){
        stats[3] += 1
    }
    
    
    //decrease the various stats
    func decreaseHealth(){
        self.stats[0] -= 1
        
        //When you increase the health stat, make sure to update the max Hp to new value
        self.maxHp = stats[0] * 10
        self.curHp = maxHp
    }
    
    func decreaseAttack(){
        self.stats[1] -= 1
    }

    func decreaseDefense(){
        self.stats[2] -= 1
    }
    
    func decreaseLuck(){
        self.stats[3] -= 1
    }
    
    //Change amount of gold player has
    func changeGold(_ amount: Int){
        self.gold += amount
    }
    
    //Get the amount of gold player has
    func getGold() -> Int{
        return gold
    }
    
    //Increase current expierence value
    func increaseExp(_ amount: Int){
        curExp += amount
    }
    
    //Stat points setters and getters
    func getStatPoint() -> Int{
        return statPoints
    }
    
    func setStatPoint(_ amt: Int){
        statPoints = amt
    }
    
    //Change attack by including the weapon
    override func getAttack() -> Int {
        let critChance = arc4random_uniform(100)
        if critChance <= stats[3]{
            return (stats[1] + weaponEquip) * 2
        }
        return stats[1] + weaponEquip
    }
    
    //Change Defence by including the armor
    override func getDefense() -> Int {
        var totalDef = 0
        
        for i in armorEquip{
            totalDef += i
        }
        return Int(arc4random_uniform(UInt32(stats[2] + totalDef)))
    }
}

//Spawn some enemy at a certain level
func spawnEnemy(level: Int) -> Character{
    let name = ["Slime", "Goblin", "Skeleton"]              //List of enemy names
    let modifier = ["Common", "Uncommon", "Rare"]           //List of modifier names
    let stats = [[4,1,1,1],[3,2,1,2],[6,5,5,5]]             //Initial Stats of enemies
    let sprite = [["temp1"],["temp2"],["temp3"]]                  //This needs to be changed in order for the sprite to be created
    let spawnChance = Int(arc4random_uniform(100))          //Chance that an enemy spawns
    let modifierChance = Int(arc4random_uniform(100))       //Chance that an enemy spawns with a specific modifer
    var enemyName: String                                   //Final name of enemy
    var enemyStats: [Int]                                   //Final stats of enemy
    var enemySprite: [String]                                 //Final sprite of enemy
    
    //Modifier 10% Rare, 30% Uncommon, 60% Common
    if modifierChance < 100 && modifierChance >= 90{
        enemyName = modifier[2]
        enemyStats = [5,5,5,5]
    } else if modifierChance < 90 && modifierChance >= 60 {
        enemyName = modifier[1]
        enemyStats = [2,2,2,2]
    } else {
        enemyName = modifier[0]
        enemyStats = [0,0,0,0]
    }
    
    //20% Chance for a Skeleton to Spawn
    if spawnChance < 100 && spawnChance >= 80 {
        enemyName += " " + name[2]
        for i in 0..<4{
            enemyStats[i] += stats[2][i]
        }
        enemySprite = sprite[2]
        
    //30% Chance for a Goblin to spawn
    } else if spawnChance < 80 && spawnChance >= 50{
        enemyName += " " + name[1]
        for i in 0..<4{
            enemyStats[i] += stats[1][i]
        }
        enemySprite = sprite[1]
        
    //50% Chance for a Slime to spawn
    } else {
       enemyName += " " + name[0]
        for i in 0..<4{
            enemyStats[i] += stats[0][i]
        }
        enemySprite = sprite[0]
    }
    
    //Change stats according to enemy level
    for i in 0..<enemyStats.count{
        let statGained = Int(arc4random_uniform(UInt32(level)))
        enemyStats[i] += statGained
    }
    //Enemy is created
    return Character(name: enemyName, stats: enemyStats, sprite: enemySprite, level: level)
}
