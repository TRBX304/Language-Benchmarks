import sys, time, platform

def sieve(n, reps):
    total = 0
    for _ in range(reps):
        is_comp = bytearray(n + 1)
        cnt = 0
        for i in range(2, n + 1):
            if not is_comp[i]:
                cnt += 1
                j = i * i
                while j <= n:
                    is_comp[j] = 1
                    j += i
        total += cnt
    return total

def bit(n):
    w = [(i * 7919 + 13) % 1000 + 1 for i in range(n)]
    target = sum(w) // 2
    cnt = 0
    for mask in range(1 << n):
        s = 0
        for i in range(n):
            if (mask >> i) & 1:
                s += w[i]
        if s == target:
            cnt += 1
    return cnt

def eq(n):
    k = n * n
    cnt = 0
    for x in range(n + 1):
        for y in range(n + 1):
            for z in range(n + 1):
                if x * x + y * y + z * z == k:
                    cnt += 1
    return cnt

def mat(n):
    a = [[((i * j) % 7 + 1) / 8 for j in range(n)] for i in range(n)]
    b = [[((i + j) % 5 + 1) / 4 for j in range(n)] for i in range(n)]
    c = [[0.0] * n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            s = 0.0
            for k in range(n):
                s += a[i][k] * b[k][j]
            c[i][j] = s
    total = 0.0
    for i in range(n):
        for j in range(n):
            total += c[i][j]
    return int(total * 32)

ev, p = sys.argv[1], int(sys.argv[2])
t = time.perf_counter()
r = sieve(10_000_000, p) if ev == "sieve" else bit(p) if ev == "bit" else mat(p) if ev == "mat" else eq(p)
print(f"{platform.python_implementation().lower()} {ev} {p} result={r} time={time.perf_counter()-t:.3f}s")
