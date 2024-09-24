class Factory:
    def __init__(self) -> None:
        pass


class Bird(Factory):
    def __init__(self) -> None:
        super(Bird, self).__init__()
        print("start bird")

    def __new__(cls, *args, **kwargs):
        print("bird.__new__")
        return super().__new__(cls, *args, **kwargs)


b = Bird()
c= Bird()
