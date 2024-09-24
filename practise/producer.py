import asyncio
import random


async def consumer(queue, id):
    while True:
        val = await queue.get()
        print('{} get a val: {}'.format(id, val))
        await asyncio.sleep(1)
        
async def producer(queue, id):
    for i in range(5):
        val = random.randint(1, 10)
        await queue.put(val)
        print('{} put a val: {}'.format(id, val))
        await asyncio.sleep(1)
        
async def main():
    queue = asyncio.Queue()
    
    consumer1 = asyncio.create_task(consumer(queue, 'consumer1'))
    consumer2 = asyncio.create_task(consumer(queue, 'consumer1'))
    producer1 = asyncio.create_task(producer(queue, 'producer1'))
    producer2 = asyncio.create_task(producer(queue, 'producer2'))            
    
    await asyncio.sleep(10)
    consumer1.cancel()
    consumer2.cancel()
    
    await asyncio.gather(consumer1, consumer2, producer1, producer2, return_exceptions=True)
    
asyncio.run(main())