from __future__ import annotations
from abc import ABC, ABCMeta, abstractmethod

class FurnitureFactory(ABC):
    
    @abstractmethod
    def createChair(self)->Chair:
        pass
    
    @abstractmethod
    def createSofa(self)->Sofa:
        pass
    
    @abstractmethod
    def createCoffeeTable(self)->CoffeeTable:
        pass

class ModernFurnitureFactory(FurnitureFactory):
    
    def createChair(self)->Chair:
        return ModernFurnitureChair()
    
    def createSofa(self)->Sofa:
        return ModernFurnitureSofa()
    
    def createCoffeeTable(self)->CoffeeTable:
        return ModernFurnitureCoffeeTable()

class VictorianFurnitureFactory(FurnitureFactory):
    
    def createChair(self)->Chair:
        return VictorianFurnitureChair()
    
    def createSofa(self)->Sofa:
        return VictorianFurnitureSofa()
    
    def createCoffeeTable(self)->CoffeeTable:
        return VictorianFurnitureCoffeeTable() 


class Chair(ABC):
    
    @abstractmethod
    def has_legs(self)->bool:
        pass
        
    @abstractmethod
    def side_pad(self)->bool:
        pass
    
class Sofa(ABC):
    
    @abstractmethod
    def has_legs(self)->bool:
        pass
        
    @abstractmethod
    def seating_capacity(self)->int:
        pass

class CoffeeTable(ABC):
    
    @abstractmethod
    def shape(self)->str:
        pass
        
    @abstractmethod
    def tray_servings(self)->int:
        pass        

class ModernFurnitureChair(Chair):
    
    def has_legs(self)->bool:
        return False
        
    def side_pad(self)->bool:
        return True
            
class ModernFurnitureSofa(Sofa):
    
    def has_legs(self)->bool:
        return False
        
    def seating_capacity(self)->int:
        return 4

class ModernFurnitureCoffeeTable(CoffeeTable):
    
    def shape(self)->str:
        return "Oval"
        
    def tray_servings(self)->int:
        return 2   
        
class VictorianFurnitureChair(Chair):
    
    def has_legs(self)->bool:
        return True
        
    def side_pad(self)->bool:
        return False
            
class VictorianFurnitureSofa(Sofa):
    
    def has_legs(self)->bool:
        return True
        
    def seating_capacity(self)->int:
        return 2

class VictorianFurnitureCoffeeTable(CoffeeTable):
    
    def shape(self)->str:
        return "Rectangular"
        
    def tray_servings(self)->int:
        return 4   

def client_requirement(furniture_factory:FurnitureFactory)->None:
    
    chair = furniture_factory.createChair()
    print('Chair Features')
    print('--------------')
    print('Has Legs : {}'.format(chair.has_legs()))
    print('Has Side_Pad : {}'.format(chair.side_pad()))
    print()
    
    sofa = furniture_factory.createSofa()
    print('Sofa Features')
    print('--------------')
    print('Has Legs : {}'.format(sofa.has_legs()))
    print('Seating Capacity : {}'.format(sofa.seating_capacity()))
    print()
    
    coffee_table = furniture_factory.createCoffeeTable()
    print('CoffeeTable Features')
    print('--------------')
    print('Shape : {}'.format(coffee_table.shape()))
    print('Tray Servings : {}'.format(coffee_table.tray_servings()))
    print()
    
if __name__ == '__main__':
    client_requirement(ModernFurnitureFactory())