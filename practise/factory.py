from abc import ABCMeta, abstractmethod


class TechnicalBooks(object):    
    def publish(self):
        return "Python Book"
    
class LiteraryBooks(object):
    def publish(self):
        return "Black Hole Book"
    

class SimpleFactory(object):
    
    @staticmethod
    def publish_book(name):
        if name == "technical":
            return TechnicalBooks()
        elif name == "literary":
            return LiteraryBooks()
       
it1 = SimpleFactory.publish_book("technical")    
     
class AbstractFactory(metaclass=ABCMeta):
    @abstractmethod
    def publish_book(self):
        pass
    
class TechnicalFactory(AbstractFactory):
    def publish_book(self):
        return TechnicalBooks()

class LiteraryFactory(AbstractFactory):
    def publish_book(self):
        return LiteraryBooks()
    
    
it = TechnicalFactory().publish_book()