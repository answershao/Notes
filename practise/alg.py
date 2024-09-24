# Definition for singly-linked list.
from typing import Optional, List
import re


class Solution:
    def latestTimeCatchTheBus(
        self, buses: List[int], passengers: List[int], capacity: int
    ) -> int:
        def search(lst, target):
            # 找到最后一个小于等于target的
            l, r = 0, len(lst)
            while l < r:
                mid = (l + r) // 2
                if lst[mid] < target:
                    l = mid
                elif lst[mid] == target:
                    return mid
                else:
                    r = mid - 1
            return l

        buses = sorted(buses)
        passengers = sorted(passengers)
        b, p = len(buses), len(passengers)
        i, j = 0, 0
        res = []
        while passengers and i < b:
            bus_start_time = buses[i]
            tail = search(passengers, bus_start_time)
            print(tail)

            new_pointer = min(tail, capacity)
            ans = bus_start_time
            max_stop_time = passengers[:new_pointer][-1]
            for i in range(2, new_pointer + 1):
                if passengers[:new_pointer][-i] + 1 != passengers[:new_pointer][-i - 1]:
                    res.append(passengers[:new_pointer][-i - 1] - 1)

            passengers = passengers[tail:]
            i += 1

        return res[-1]


buses = [10, 20]
passengers = [2, 17, 18, 19]
capacity = 2

s = Solution()
s.latestTimeCatchTheBus(buses, passengers, capacity)
