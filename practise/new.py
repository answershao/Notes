# class A:
#     def __new__(cls):
#         print("__new__")
#         return super().__new__(cls)

#     def __init__(self) -> None:
#         print("__init__")

# a = A()


import threading


class Singleton:
    _instance_lock = threading.Lock()

    # def __new__(cls, *args, **kwargs):
    #     if not hasattr(Singleton, "_instance"):
    #         with Singleton._instance_lock:
    #             if not hasattr(Singleton, "_instance"):
    #                 Singleton._instance = object.__new__(cls, *args, **kwargs)
    #     return Singleton._instance


obj1 = Singleton()
obj2 = Singleton()
print(obj1, obj2)


def task(arg):
    obj = Singleton()
    print(obj)


for i in range(10):
    t = threading.Thread(
        target=task,
        args=[
            i,
        ],
    )
    t.start()
