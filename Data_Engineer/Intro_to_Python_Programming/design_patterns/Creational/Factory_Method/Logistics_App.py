from __future__ import annotations
from abc import ABC, ABCMeta, abstractmethod

class Logistics(ABC):
    
    @abstractmethod
    def create_logistics(self)->Transport:
        pass
        
    def plan_delivery(self)->str:
        transport = self.create_logistics()
        delivery_outcome = transport.delivery()
        return delivery_outcome

class Transport(ABC):

    @abstractmethod
    def delivery(self)->str:
        pass

class RoadLogistics(Logistics):
    def create_logistics(self)->Transport:
        return TruckTransport()

class SeaLogistics(Logistics):
    def create_logistics(self)->Transport:
        return ShipTransport()        
    
class TruckTransport(Transport):
    def delivery(self)->str:
        print("I have implemented truck delivery\n")
        return "Truck Delivery Completed" 

class ShipTransport(Transport):
    def delivery(self)->str:
        print("I have implemented ship delivery\n")
        return "Ship Delivery Completed"

def client_requirement(logistics:Logistics)->None:
    return logistics.plan_delivery()
    
if __name__ == '__main__':
    print()
    print(client_requirement(RoadLogistics()))
    print()
    print(client_requirement(SeaLogistics()))
    print()