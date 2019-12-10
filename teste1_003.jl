
# P1.1
# séries numericas
# 1. com range
# 2. comprehension

# (a) {−3,−1,1,…,25};
a1 = collect(-3:2:25)
println(a1)
a2 = [x for x in -3:2:25]
println(a2)

# (b) {100,90,80,…,−100};
b1 = collect(100:-10:-100)
println(b1)
b2 = [x for x in 100:-10:-100]
println(b2)

# (c) {10^−3,0.01,0.1,…,10^12};
c1 = 10.0.^collect(-3:1:12)
println(c1)
c2 = 10.0.^[x for x in -3:1:12] # [10.0^x for x in -3:12]
println(c2)

# (d) {12,…,2,1,0,1,2,…,12};
d1 = [collect(12:-1:0); collect(1:1:12)]
println(d1)
d2 = [abs(x) for x in -12:12] # [[x for x in 12:-1:0]; [x for x in 1:1:12]]
println(d2)

# (e) {1+0.5j,2+j,3+1.5j,…,14+7j};
e1 = collect(1.0:1.0:14.0) .+ collect(0.5:0.5:7.0)*im
println(e1)
e2 = [x + (x/2).*im for x in 1.0:1.0:14.0]
println(e2)

# (f) {sin(𝑥):𝑥=−π,−9π/10,8π/10,…,π/2};
f1 = sin.(collect(-π:π/10:π/2))
println(f1)
f2 = sin.([x for x in -π:π/10:π/2]) # [sin(x) for x in -π:π/10:π/2]
println(f2)

# (g) {e^𝑗𝑛:𝑛=0,π/8,1π/4,…,3π/2};
g1 = exp.(im*collect(0:π/8:3/2*π))
println(g1)
g2 = exp.(im.*[x for x in 0:π/8:3π/2]) # [exp(im*n) for n in 0:π/8:3π/2]
println(g2)

# (h) {sin𝑥^2−cos2𝑥:𝑥=0,0.1,0.2,..,10}.
xh = collect(0.0:0.1:10)
h1 = (sin.(xh)).^2 - cos.(2.0*xh)
println(h1)
println()
h2 = [(sin.(x)).^2 - cos.(2.0*x) for x in 0.0:0.1:10.0]
println(h2)

# P1.2 representar as seguintes series numericas (stem)
import Pkg;
Pkg.add("GR")

using GR

# (a) {(𝑛^1.5)/2 − 1: 𝑛=1,2,3,…,20};
na = collect(1:1:20);
ya = na.^1.5 / 2;
stem(na, ya)

# (b) {√|𝑎|(𝑎^2+100/𝑎):𝑎=−6,−5.8,−5.6,…,6};
nb = collect(-6.0:0.2:6.0)
yb = sqrt.(abs.(nb)) .* (nb .^2 .+ 100 ./ nb)
stem(nb, yb)

# (c) {3sin^2𝑥 − 2cos𝑥 − 2: 𝑥 = −π/2,−9π/20,−8π/20,…,5π/2};
nc = collect(-π/2:π/20:5π/2)
yc = 3.0.*sin.(nc).^2 .- 2.0.*cos.(nc) .- 2.0
stem(nc, yc)

# (d) {|3sin^2𝑥 − 2cos𝑥| − 2 :𝑥 = −π/2,−9π/20,−4π/10,…,3π/2};
nd = collect(-π/2:π/20:3π/2)
yd = abs.(3.0.*sin.(nd).^2.0 .- 2.0.*cos.(nd) .-2.0)
stem(nd, yd)

# (e) {{   2,     𝑥 < 0
#     {{0.5𝑥 + 2, 𝑥 ≥ 0:𝑥 = −5,−4,−3,…,15};
ne = collect(-5:1:15)
ye = (ne -> ne < 0 ? 2.0 : (0.5 .* ne .+ 2.0))
stem(ne, ye)

# (f) {{ √(𝑥),     𝑥 ≤ 16
#     {{ −𝑥/8 + 6, 𝑥 > 16 :𝑥 = 0, 0.5, 1, …, 30}.
nf = collect(0.0:0.5:30.0)
yf = (nf -> nf <= 16 ? sqrt.(nf) : (-(nf/8) .+ 6.0))
stem(nf, yf)

# P2.2 Gere as seguintes séries numérica e produza os respetivos gráficos em Julia:
xlabel("n")
ylabel("x[n]")

# (a) 𝑥[𝑛] = 2𝛿[𝑛−1] + 𝛿[𝑛] − 𝛿[𝑛 + 4] + 2𝛿[𝑛 + 7], −10 ≤ 𝑛 ≤ 5;
δ(xa) = xa == 0 ? 1.0 : 0.0;
# −10 ≤ 𝑛 ≤ 5
na = collect(-10.0:1.0:5.0)
xa = (2*δ.(na.-1)) .+ δ.(na) .- δ.(na .+ 4) .+ 2.0.*δ.(na .+ 7.0)

xlim([-10.25, 5.25]);
ylim([-1.1, 2.1]);
stem(na, xa)

# (b) 𝑥[𝑛] = Σ e^−|𝑘| 𝛿[𝑛 − 2𝑘], −10 ≤ 𝑛 ≤ 10;
# Σ [5; 𝑘 =−5]
δ(xb) = xb == 0 ? 1.0 : 0.0;
# −10 ≤ 𝑛 ≤ 10
nb = collect(-10.0:1.0:10.0)
# xb = sum.([exp.^(-abs.(k)) .* δ.(nb .- 2.0 .* k) for k = -5.0:1.0:5.0])
# xb = [sum([exp(-abs(k)) * (xb -> xb == 0 ? 1.0 : 0.0)(nb - 2*k) for k = -5:1:5]) for nb = -10:1:10];
xb = [sum([exp(-abs(k)) * δ.(nb - 2*k) for k = -5:1:5]) for nb = nb]

xlim([-10.5, 10.5]);
ylim([-0.05, 1.05]);
stem(nb, xb)

# (c) 𝑥[𝑛] = 3𝑢[−𝑛−5] − 2𝑢[−𝑛] − 𝑢[−𝑛+5] + 𝑢[𝑛−10], −10 ≤ 𝑛 ≤ 20;
# −10 ≤ 𝑛 ≤ 20
nc = collect(-10.0:1.0:20.0)
u(xc) = xc >= 0 ? 1.0 : 0.0;
xc = (3.0.*u.(-nc .- 5.0)) .- (2.0.*u.(-nc)) .- (u.(-nc .+ 5.0)) .+ (u.(nc .- 10.0))

xlim([-10.5, 20.5]);
ylim([-3.1, 1.1]);
stem(nc, xc)

# (d) 𝑥[𝑛] = 2sin(0.1π𝑛) + 1.8sin(0.2π𝑛 + 0.25π) + 1.2cos(0.4π𝑛−0.25π), −10 ≤ 𝑛 ≤ 30;
# −10 ≤ 𝑛 ≤ 30
nd = collect(-10.0:1.0:30.0)
xd = (2.0.*sin.(0.1.*π.*nd)) .+ (1.8.*sin.(0.2.*π.*nd .+ 0.25.*π)) .+ (1.2.*cos.(0.4.*π.*nd .- 0.25.*π))
# xd = (2 * sin.(0.1 * π * nd)) .+ (1.8 * sin.(0.2 * π * nd .+ 0.25 * π)) .+ (1.2 * cos.(0.4 * π * nd .- 0.25 * π));
xlim([-10.5, 30.5]);
ylim([-4.0, 4.0]);
stem(nd, xd)

# (e) 𝑥[𝑛] = 0.9^𝑛(𝑢[𝑛] − 𝑢[𝑛−10] + 𝑢[−𝑛+25] − 𝑢[−𝑛+15]),
# −10 ≤ 𝑛 ≤ 30
ne = collect(-10.0:1.0:30.0)
u(xe) = xe >= 0 ? 1.0 : 0.0;
xe = 0.9.^ne.*((u.(ne)) .- (u.(ne.-10)) .+ (u.(-ne.+25)) .- (u.(-ne.+15)))

xlim([-10.5, 30.5]);
ylim([-0.05, 1.05]);
stem(ne, xe)

# P2.3 Produza os gráficos das seguintes séries periódicas:
xlabel("n");
ylabel("x[n]");
# (a) 𝑥[𝑛] = {… ,0, −1,0↑, 1,0, −1,0,1, … }, −10 ≤ 𝑛 ≤ 10;
# −10 ≤ 𝑛 ≤ 10
na = collect(-10:1:10)
pa = [0,1,0,-1] # escolher uma série
# formula => x = p[mod.(n .-m1, length(p)) .+ 1]
xa = pa[mod.(na, length(pa)) .+ 1]

xlim([-10.25, 10.25]);
ylim([-1.05, 1.05]);
stem(na, xa)

# (b) {… , 𝑥[38], 𝑥[39], 𝑥[40], 𝑥[41], 𝑥[42], 𝑥[43], 𝑥[44], … } = {… ,10,0,0,10,0,0,10, … }, −8 ≤ 𝑥 ≤ 12.
# −8 ≤ 𝑥 ≤ 12
nb = collect(-8:1:12)
m1b = 40;
# formula => x = p[mod.(n .-m1, length(p)) .+ 1]
pb = [0,10,0]
xb = pb[mod.(nb .- m1b, length(pb)) .+ 1]

xlim([-8.25, 12.25]);
ylim([-0.5, 10.5]);

stem(nb, xb)


# exercicios teste modelo convuloção
function conv(n_x, n_h, x, h)
    l_x = length(x)         # length do vetor x
    l_h = length(h)         # length do vetor h
    l_y = l_x + l_h - 1     # length do vetor y

    h = h[end:-1:1]     # reverse vetor h
    y = zeros(l_y)      # criamos o vetor com zeros (vazio)

    for i in 1:l_y
        n_i = max(i, l_h)  # n inicial
        n_f = min(i + l_h - 1, l_y)  # n final
        y[i] = sum(x[(n_i:n_f) .- l_h .+ 1] .* h[(n_i:n_f) .- i .+ 1])
    end

    n_y = collect(n_x[1] + n_h[1] : n_x[end] + n_h[end])

    return y, n_y
end

# (a) 𝑥[𝑛]={−3,0↑,3}, ℎ[𝑛]={−1,0↑,1};
# indices x[n]
n_x_A = [-1, 0, 1]
# x[n]
x_A = [-3, 0, 3]
# indices h[n]
n_h_A = [-1, 0, 1]
# h[n]
h_A = [-1, 0, 1]
# resultado
y_A = conv(n_x_A, n_h_A, x_A, h_A)
println(y_A)

# (b) 𝑥[𝑛]={1,2↑,3,4}, ℎ[𝑛]={0↑,0,0,2,2,4,6}.
# indices x[n]
n_x_B = [-1, 0, 1, 2]
# x[n]
x_B = [1, 2, 3, 4]
# indices h[n]
n_h_B = [0, 1, 2, 3, 4, 5, 6]
# h[n]
h_B = [0, 0, 0, 2, 2, 4, 6]
# resultado
y_B = conv(n_x_B, n_h_B, x_B, h_B)
println(y_B)

# P2.5
# (a) 𝑥[𝑛]=3^−𝑛(𝑢[𝑛+1]−𝑢[𝑛−5])
# ℎ[𝑛]=𝑢[𝑛]−𝑢[𝑛−7]
# −10 ≤ 𝑛 ≤ 15;
u(n) = n >= 0 ? 1.0 : 0.0;
n = collect(-10:15);
x = 3.0.^-n.*(u.(n .+ 1) - u.(n .- 5));
h = u.(n) - u.(n .- 7);
n_y, y = conv(n, n, x, h);
using GR
xlabel("n");
ylabel("x[n]");
stem(n, x)
ylabel("h[n]");
stem(n, h)
ylabel("x[n]*h[n]");
stem(n_y, y)

# (b) 𝑥[𝑛]=𝑛4(𝑢[𝑛]−𝑢[𝑛−6])
# ℎ[𝑛]=2(𝑢[𝑛+2]−𝑢[𝑛−3])
# −10≤𝑛≤10;
u(n) = n >= 0 ? 1.0 : 0.0;
n = collect(-10:10);
x = n/4.0.*(u.(n) - u.(n .- 6));
h = 2*(u.(n .+ 2) - u.(n .- 3));
n_y, y = conv(n, n, x, h);
using GR
xlabel("n");
ylabel("x[n]");
stem(n, x)
ylabel("h[n]");
stem(n, h)
ylabel("x[n]*h[n]");
stem(n_y, y)

# 𝑥[𝑛]=0.8^𝑛 𝑢[𝑛],
# ℎ[𝑛]=(−0.9)𝑛𝑢[𝑛],
# −5 ≤ 𝑛 ≤ 55.
u(n) = n >= 0 ? 1.0 : 0.0;
n = collect(-5:55);
x = 0.8.^n.*u.(n);
h = (-0.9).^n.*u.(n);
n_y, y = conv(n, n, x, h);
using GR
xlabel("n");
ylabel("x[n]");
stem(n, x)
ylabel("h[n]");
stem(n, h)
ylabel("x[n]*h[n]");
stem(n_y, y)

# (a) 𝑥1[𝑛]=Σ 0.5^𝑘 𝛿[−0.5𝑛−𝑘],
# entre 2 e 𝑘=−2
# −10≤𝑛≤10;
using GR
δ(n) = n == 0 ? 1.0 : 0.0;
n = collect(-10:10);
x₁ = [sum([0.5^k*δ(-0.5*n - k) for k = -2:2]) for n = -10:10];
stem(n, x₁)

# (b) 𝑥2[𝑛] = e ^ (0.1𝑛)(𝑢[−𝑛−4]−2𝑢[−𝑛]+𝑢[𝑛−4]−𝑢[𝑛−8]), 
# −10≤𝑛≤10;
using GR
u(n) = n >= 0 ? 1.0 : 0.0;
n = collect(-10:10);
x = exp.(0.1*n).*(u.(-n .- 4) .- 2*u.(-n) .+ u.(n .- 4) .- u.(n .- 8));

xlim([-10.5, 10.5]);
ylim([-2.5, 2.5]);
stem(n, x)
