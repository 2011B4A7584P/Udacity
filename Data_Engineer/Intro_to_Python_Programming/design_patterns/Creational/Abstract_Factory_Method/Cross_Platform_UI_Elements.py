from __future__ import annotations
from abc import ABC, ABCMeta, abstractmethod

class GUIFactory(ABC):
    
    @abstractmethod
    def createButton(self)->Button:
        pass
    
    @abstractmethod
    def createCheckbox(self)->Checkbox:
        pass

class WindowsGUIFactory(GUIFactory):
    
    def createButton(self)->Button:
        return WindowsGUIButton()
    
    def createCheckbox(self)->Checkbox:
        return WindowsGUICheckbox()
    
class MacGUIFactory(GUIFactory):

    def createButton(self)->Button:
        return MacGUIButton()
    
    def createCheckbox(self)->Checkbox:
        return MacGUICheckbox()

class Button(ABC):

    @abstractmethod
    def paint(self)->str:
        pass
    
class Checkbox(ABC):

    @abstractmethod
    def paint(self)->str:
        pass


class WindowsGUIButton(Button):

    def paint(self)->str:
        return "Render Button in Windows Style"
            
class WindowsGUICheckbox(Checkbox):

    def paint(self)->str:
        return "Render Checkbox in Windows Style"
          
class MacGUIButton(Button):

    def paint(self)->str:
        return "Render Button in Mac Style"
            
class MacGUICheckbox(Checkbox):

    def paint(self)->str:
        return "Render Checkbox in Mac Style"
        
def client_requirement(gui_factory:GUIFactory)->None:
    
    button = gui_factory.createButton()
    print(button.paint())
    print('---------')
    
    checkbox = gui_factory.createCheckbox()
    print(checkbox.paint())
    print('--------------')
    
if __name__ == '__main__':
    client_requirement(WindowsGUIFactory())
    client_requirement(MacGUIFactory())