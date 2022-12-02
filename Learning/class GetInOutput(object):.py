class GetInOutput(object):
    _instances = {}

    def __init__(self, func) -> None:
        self.func = func

    def __call__(self, word):
        output = self.func(word)
        if word and word != output and word not in GetInOutput._instances:
            GetInOutput._instances[word] = self.func(word)
        return self.func(word)