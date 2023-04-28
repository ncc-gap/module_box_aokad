For detail see,
https://github.com/exaloop/codon

```
def fib(n):
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()
fib(1000)
```

The codon compiler has a number of options and modes:
```
# compile and run the program
codon run fib.py
# 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987
```
