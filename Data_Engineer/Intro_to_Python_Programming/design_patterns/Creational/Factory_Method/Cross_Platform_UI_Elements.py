from __future__ import annotations
from abc import ABC, ABCMeta, abstractmethod

class Dialog(ABC):
    
    @abstractmethod
    def create_button(self)->Button:
        pass
        
    def render(self)->str:
        button = self.create_button()
        button_outcome = button.render()
        return button_outcome

class Button(ABC):
    
    @abstractmethod
    def render(self)->str:
        pass

class WindowsDialog(Dialog):
    def create_button(self)->Button:
        return WindowsButton()

class WebDialog(Dialog):
    def create_button(self)->Button:
        return WebButton()        
    
class WindowsButton(Button):
    def render(self)->str:
        print("Rendering via Windows Button\n")
        return "Windows Button Rendered" 

class WebButton(Button):
    def render(self)->str:
        print("Rendering via Web Button\n")
        return "Web Button Rendered" 

def client_ui_requirement(dialog:Dialog)->None:
    return dialog.render()
    
if __name__ == '__main__':
    print()
    print(client_ui_requirement(WindowsDialog()))
    print()
    print(client_ui_requirement(WebDialog()))