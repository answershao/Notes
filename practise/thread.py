from concurrent.futures import ThreadPoolExecutor, ProcessPoolExecutor
import threading
import time

def crawl_page(url):
    print("crawling {}".format(url))
    sleep_time = int(url.split('_')[-1])
    time.sleep(sleep_time)
    print('{} OK'.format(url))
    
def main(urls):
   
    with ThreadPoolExecutor(max_workers=2) as executor:
        executor.map(crawl_page, urls)
    
        
main((['url_1', 'url_2', 'url_3', 'url_4']))