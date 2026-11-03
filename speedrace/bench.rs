use std::env;
use std::time::Instant;

fn sieve(n: usize, reps: usize) -> u64 {
    let mut total = 0u64;
    for _ in 0..reps {
        let mut is_comp = vec![false; n + 1];
        let mut cnt = 0u64;
        for i in 2..n + 1 {
            if !is_comp[i] {
                cnt += 1;
                let mut j = i * i;
                while j <= n {
                    is_comp[j] = true;
                    j += i;
                }
            }
        }
        total += cnt;
    }
    total
}

fn bit(n: usize) -> u64 {
    let w: Vec<i32> = (0..n).map(|i| ((i * 7919 + 13) % 1000 + 1) as i32).collect();
    let target = w.iter().sum::<i32>() / 2;
    let mut cnt = 0u64;
    for mask in 0..(1u32 << n) {
        let mut s = 0i32;
        for i in 0..n {
            if (mask >> i) & 1 == 1 {
                s += w[i];
            }
        }
        if s == target {
            cnt += 1;
        }
    }
    cnt
}

fn eq(n: i32) -> u64 {
    let k = n * n;
    let mut cnt = 0u64;
    for x in 0..n + 1 {
        for y in 0..n + 1 {
            for z in 0..n + 1 {
                if x * x + y * y + z * z == k {
                    cnt += 1;
                }
            }
        }
    }
    cnt
}

fn mat(n: usize) -> u64 {
    let mut a = vec![vec![0.0f64; n]; n];
    let mut b = vec![vec![0.0f64; n]; n];
    let mut c = vec![vec![0.0f64; n]; n];
    for i in 0..n {
        for j in 0..n {
            a[i][j] = ((i * j) % 7 + 1) as f64 / 8.0;
            b[i][j] = ((i + j) % 5 + 1) as f64 / 4.0;
        }
    }
    for i in 0..n {
        for j in 0..n {
            let mut s = 0.0;
            for k in 0..n {
                s += a[i][k] * b[k][j];
            }
            c[i][j] = s;
        }
    }
    let total: f64 = c.iter().map(|row| row.iter().sum::<f64>()).sum();
    (total * 32.0) as u64
}

fn main() {
    let a: Vec<String> = env::args().collect();
    let ev = a[1].as_str();
    let p: usize = a[2].parse().unwrap();
    let t = Instant::now();
    let r = match ev {
        "sieve" => sieve(10_000_000, p),
        "bit" => bit(p),
        "mat" => mat(p),
        _ => eq(p as i32),
    };
    println!("rust {} {} result={} time={:.3}s", ev, p, r, t.elapsed().as_secs_f64());
}
