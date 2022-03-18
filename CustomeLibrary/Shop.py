from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        self.selflibrary = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def helloworld(self):
        print("hello robot")
    @keyword
    def add_items_to_cart_and_checkout(self,productList):
        i=1
        prdoctsTitles=self.selflibrary.get_webelements("css:.card-title")
        for productTitle in prdoctsTitles:
            if productTitle.text in productList:
                print(productTitle)
                self.selflibrary.click_button("xpath:(//div[@class='card-footer'])["+str(i)+"]/button")
            i=i+1
        self.selflibrary.click_link("css:li.active a")
