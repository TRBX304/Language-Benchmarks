function sieve(n, reps) {
  let total = 0;
  for (let r = 0; r < reps; r++) {
    const isComp = new Uint8Array(n + 1);
    let cnt = 0;
    for (let i = 2; i <= n; i++) {
      if (!isComp[i]) {
        cnt++;
        for (let j = i * i; j <= n; j += i) isComp[j] = 1;
      }
    }
    total += cnt;
  }
  return total;
}
function bit(n) {
  const w = [];
  for (let i = 0; i < n; i++) w.push((i * 7919 + 13) % 1000 + 1);
  const target = Math.floor(w.reduce((a, b) => a + b, 0) / 2);
  let cnt = 0;
  for (let mask = 0; mask < (1 << n); mask++) {
    let s = 0;
    for (let i = 0; i < n; i++) if ((mask >> i) & 1) s += w[i];
    if (s === target) cnt++;
  }
  return cnt;
}
function eq(n) {
  const k = n * n;
  let cnt = 0;
  for (let x = 0; x <= n; x++)
    for (let y = 0; y <= n; y++)
      for (let z = 0; z <= n; z++)
        if (x * x + y * y + z * z === k) cnt++;
  return cnt;
}
function mat(n) {
  const a = [], b = [], c = [];
  for (let i = 0; i < n; i++) {
    a.push(new Array(n).fill(0)); b.push(new Array(n).fill(0)); c.push(new Array(n).fill(0));
    for (let j = 0; j < n; j++) {
      a[i][j] = ((i * j) % 7 + 1) / 8;
      b[i][j] = ((i + j) % 5 + 1) / 4;
    }
  }
  for (let i = 0; i < n; i++)
    for (let j = 0; j < n; j++) {
      let s = 0;
      for (let k = 0; k < n; k++) s += a[i][k] * b[k][j];
      c[i][j] = s;
    }
  let total = 0;
  for (let i = 0; i < n; i++) for (let j = 0; j < n; j++) total += c[i][j];
  return total * 32;
}
const [ev, ps] = process.argv.slice(2), p = parseInt(ps);
const t = performance.now();
const r = ev === "sieve" ? sieve(10_000_000, p) : ev === "bit" ? bit(p) : ev === "mat" ? mat(p) : eq(p);
console.log(`${typeof Bun !== "undefined" ? "bun" : "node"} ${ev} ${p} result=${r} time=${((performance.now() - t) / 1000).toFixed(3)}s`);
