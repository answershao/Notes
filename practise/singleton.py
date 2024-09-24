# boss直聘，电鸭

# 线上笔试，至少两轮面试，第一轮有code
# 笔试两道算法➕20道选择➕一道web代码 (偏网络和测试工程)

# Python 基础知识，进程，协程，线程，Kafka
# 单利模式，工厂模式，Python写法


import threading
import time

# class Singleton(type):
#     def __init__(self,*args, **kwargs) -> None:
#         super(Singleton, self).__init__(*args, **kwargs)

#     def __call__(cls, *args, **kwargs):
#         print('cls', cls)
#         obj = cls.__new__(cls, *args, **kwargs)
#         cls.__init__(obj, *args, **kwargs)
#         return obj

# class Foo(metaclass=Singleton):
#     def __init__(self, name) -> None:
#         self.name = name
#         print("create {}".format(name))

#     def __new__(cls, *args, **kwargs):
#         return object.__new__(cls)


class SingletonType(type):
    _instance_lock = threading.Lock()

    def __call__(cls, *args, **kwargs):
        if not hasattr(cls, "_instance"):
            with SingletonType._instance_lock:
                if not hasattr(cls, "_instance"):
                    cls._instance = super(SingletonType, cls).__call__(*args, **kwargs)
        return cls._instance


class Singleton(type):
    _instance_lock = threading.Lock()

    def __call__(cls, *args, **kwargs):
        if not hasattr(cls, "_instance"):
            with Singleton._instance_lock:
                if not hasattr(cls, "_instance"):
                    cls._instance = super(Singleton, cls).__call__(*args, **kwargs)

        return cls._instance


class Foo(metaclass=SingletonType):
    def __init__(self, name) -> None:
        print("create {}".format(name))
        time.sleep(1)


def task():
    obj = SingletonType.instance()
    print(obj)


for i in range(10):
    t = threading.Thread(
        target=task,
        args=[
            i,
        ],
    )
    t.start()
