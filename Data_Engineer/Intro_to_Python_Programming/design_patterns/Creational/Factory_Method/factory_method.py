'''
Provides an interface for creating objects in a superclass, 
but allows subclasses to alter the type of objects that will 
be created.
'''

from __future__ import annotations
from abc import ABC, ABCMeta, abstractmethod

class Creator(ABC):
    @abstractmethod
    def factory(self)->Product:
        pass
        
    def product_operation(self)->str:
        product = self.factory()
        product_outcome = product.operation()
        return product_outcome

class Product(ABC):
    @abstractmethod
    def operation(self)->str:
        pass

class ConcreteCreatorProductOne(Creator):
    def factory(self)->Product:
        return ConcreteProductOne()

class ConcreteCreatorProductTwo(Creator):
    def factory(self)->Product:
        return ConcreteProductTwo()        
    
class ConcreteProductOne(Product):
    def operation(self)->str:
        print("I have implemented product one operation\n")
        return "Product_One_Operation" 

class ConcreteProductTwo(Product):
    def operation(self)->str:
        print("I have implemented product two operation\n")
        return "Product_Two_Operation"

def client_operation(creator:Creator)->None:
    return creator.product_operation()
    
if __name__ == '__main__':
    print(client_operation(ConcreteCreatorProductOne()))