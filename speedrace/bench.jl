function sieve(n, reps)
    total = 0
    for _ in 1:reps
        is_comp = zeros(Bool, n + 1)   # 1要素1バイト。添字は値+1
        cnt = 0
        for i in 2:n
            if !is_comp[i+1]
                cnt += 1
                j = i * i
                while j <= n
                    is_comp[j+1] = true
                    j += i
                end
            end
        end
        total += cnt
    end
    return total
end

function bitsearch(n)
    w = [(i * 7919 + 13) % 1000 + 1 for i in 0:n-1]
    target = sum(w) ÷ 2
    cnt = 0
    for mask in 0:(1 << n)-1
        s = 0
        for i in 0:n-1
            if (mask >> i) & 1 == 1
                s += w[i+1]
            end
        end
        if s == target
            cnt += 1
        end
    end
    return cnt
end

function eq(n)
    k = n * n
    cnt = 0
    for x in 0:n
        for y in 0:n
            for z in 0:n
                if x * x + y * y + z * z == k
                    cnt += 1
                end
            end
        end
    end
    return cnt
end

function mat(n)
    A = zeros(Float64, n, n); B = zeros(Float64, n, n); C = zeros(Float64, n, n)
    for i in 0:n-1, j in 0:n-1
        A[i+1, j+1] = ((i * j) % 7 + 1) / 8
        B[i+1, j+1] = ((i + j) % 5 + 1) / 4
    end
    for i in 1:n
        for j in 1:n
            s = 0.0
            for k in 1:n
                s += A[i, k] * B[k, j]
            end
            C[i, j] = s
        end
    end
    return Int(sum(C) * 32)
end

function main()
    ev, p = ARGS[1], parse(Int, ARGS[2])
    t = time_ns()
    r = ev == "sieve" ? sieve(10_000_000, p) : ev == "bit" ? bitsearch(p) : ev == "mat" ? mat(p) : eq(p)
    println("julia $ev $p result=$r time=$(round((time_ns() - t) / 1e9, digits=3))s")
end

main()
