import signal
import sys
from time import sleep

def handler(signum, frame):
    print('Intercettato segnale', signum)
    sys.exit(0)

signal.signal(signal.SIGTERM, handler)


if __name__ == "__main__":
    i = 0
    while True:
        i += 1
        print("Iteration {}".format(i))
        sleep(1)
