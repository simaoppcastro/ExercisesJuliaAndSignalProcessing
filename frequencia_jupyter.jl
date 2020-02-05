import Pkg

Pkg.add("GR")

using GR

############################# -> P1.1 <- #########################################################
## Produza as seguintes séries numéricas (vetores) em Julia utilizando a função range (ou :):,
## (a) {−3,−1,1,…,25};
println(collect(-3:2:25))

## (b) {100,90,80,…,−100};
println(collect(100:-10:-100))

## (c) {10^−3,0.01,0.1,…,10^12};
println(10.0.^collect(-3:12))

## (d) {12,…,2,1,0,1,2,…,12};
println([collect(12:-1:0);collect(1:12)])
## ou
println(abs.(collect(-12:12)))

## (e) {1+0.5j,2+j,3+1.5j,…,14+7j};
println(collect(1:14) .+ collect(0.5:0.5:7).*im)

## (f) {sin(𝑥):𝑥=−π,−9π/10,8π/10,…,π/2};
## 9π/10 - 8π/10 = π/10
println(sin.(collect(-π:π/10:π/2)))

## (g) {e^j𝑛: 𝑛 = 0,π/8,1π/4,…,3π/2};
## π/8 - 1π/4 = -π/8
print(exp.(im .* collect(0:π/8:3π/2)))

## (h) {sin𝑥2−cos2𝑥:𝑥=0,0.1,0.2,..,10}.
Xh = collect(0:0.1:10)
println(sin.(Xh.^2) .- cos.(2 .* Xh))

############################# -> P1.1.2 <- #########################################################
## Produza as séries numéricas (vetores) de P1.1 em Julia utilizando a criação de vetores com expressões (comprehension).
## (a) {−3,−1,1,…,25};
println([x for x in -3:2:25])

## (b) {100,90,80,…,−100};
println([x for x in 100:-10:-100])

## (c) {10^−3,0.01,0.1,…,10^12};
println(10.0.^[x for x in -3:12])

## (d) {12,…,2,1,0,1,2,…,12};
println([[x for x in 12:-1:0]; [x for x in 1:12]])

## (e) {1+0.5j,2+j,3+1.5j,…,14+7j};
println([x for x in 1:14] .+ ([x for x in 0.5:0.5:7].*im))

## (f) {sin(𝑥):𝑥=−π,−9π/10,8π/10,…,π/2};
## 9π/10 - 8π/10 = π/10
println(sin.([x for x in -π:π/10:π/2]))

## (g) {e^j𝑛: 𝑛 = 0,π/8,1π/4,…,3π/2};
## π/8 - 1π/4 = -π/8
println(exp.([x for x in 0:π/8:3π/2]))

## (h) {sin𝑥2−cos2𝑥:𝑥=0,0.1,0.2,..,10}.
println([(sin.(Xh.^2) .- cos.(2 .* Xh)) for Xh in 0:0.1:10])

############################# -> P1.2 <- #########################################################
## Produza os gráficos das seguintes séries numéricas em Julia utilizando a função stem:
## (a) {(𝑛^1.5)/2 − 1: 𝑛=1,2,3,…,20};
## stem(n, y)
stem(collect(1:20), (collect(1:20)).^1.5 / 2)

## (b) {√|𝑎|(𝑎^2+100/𝑎):𝑎=−6,−5.8,−5.6,…,6};
nb = [collect(-6.0:0.2:0); collect(1:0.2:6)]
stem(nb, (sqrt.(abs.(nb)) .* (nb.^2.0 .+ 100.0./nb)))

## (c) {3sin^2𝑥 − 2cos𝑥 − 2: 𝑥 = −π/2,−9π/20,−8π/20,…,5π/2};
## π/2 - 9π/20 = π/20
nc = collect(-π/2:π/20:5π/2)
stem(nc, (3.0.*sin.(nc).^2.0 .- 2.0.*cos.(nc) .- 2.0))

## (d) {|3sin^2𝑥 − 2cos𝑥| − 2 :𝑥 = −π/2,−9π/20,−4π/10,…,3π/2};
## π/2 - 9π/20 = π/20
nd = collect(-π/2:π/20:3π/2)
stem(nd, (abs.(3.0.*sin.(nd).^2.0 .- 2.0.*cos.(nd)) .- 2))

## (e) {{   2,     𝑥 < 0
##     {{0.5𝑥 + 2, 𝑥 ≥ 0: 𝑥 = −5,−4,−3,…,15};
ne = collect(-5:15)
stem(ne, ((ne -> ne < 0 ? 2.0 : 0.5*ne + 2).(ne)))

## (f) {{ √(𝑥),     𝑥 ≤ 16
##     {{ −𝑥/8 + 6, 𝑥 > 16 :𝑥 = 0, 0.5, 1, …, 30}.
nf = collect(0.0:0.5:30.0)
stem(nf, ((nf -> nf <= 16.0 ? sqrt.(nf) : -nf/8 + 6).(nf)))

############################# -> P2.1 <- #########################################################
## Considere os seguinte sinal: 𝑥[𝑛]={1,2↑,3,4,5,6,7,8,9}.
## Determine os sinais resultante das seguintes operações:
y[n] = x[-n+4]
y[-3] = x[-(-3)+4] = 9
y[-2] = x[-(-2)+4] = 8
y[-1] = x[-(-1)+4] = 7
y[0] = x[0+4] = 6
y[1] = x[-1+4] = 5
y[2] = x[-2+4] = 4
y[3] = x[-3+4] = 3
y[4] = x[-4+4] = 2
y[5] = x[-5+4] = 1
y[6] = x[-6+4] = 0
y[n] = {9,8,7,6↑,5,4,3,2,1}

############################# -> P2.2 <- #########################################################
## Gere as seguintes séries numérica e produza os respetivos gráficos em Julia:
xlabel("x")
ylabel("x[n]")
## importante
u(x) = x >= 0 ? 1.0 : 0.0;
δ(x) = x == 0 ? 1.0 : 0.0;

## (a) 𝑥[𝑛] = 2𝛿[𝑛 − 1] + 𝛿[𝑛] − 𝛿[𝑛 + 4] + 2𝛿[𝑛 + 7], −10 ≤ 𝑛 ≤ 5;
na = collect(-10:5)
xa = 2 .* δ.(na .- 1) .+ δ.(na) .- δ.(na .+ 4) .+ 2 .* δ.(na .+ 7)
xlim([-10.25, 5.25])
ylim([-1.1, 2.1])
stem(na, xa)

## (b) 𝑥[𝑛] = ∑ e−|𝑘| 𝛿[𝑛 − 2𝑘] ,−10 ≤ 𝑛 ≤ 10;
## sum(𝑘 = −5 -> 5)
nb = collect(-10:10);
xb = [sum([exp(-abs(k)) .* δ.(nb .- 2 * k) for k = -5:5]) for nb = -10:10]
xlim([-10.5, 10.5])
ylim([-0.05, 1.05])
stem(nb, xb)

## (c) 𝑥[𝑛] = 3𝑢[−𝑛−5] − 2𝑢[−𝑛] − 𝑢[−𝑛+5] + 𝑢[𝑛−10], −10 ≤ 𝑛 ≤ 20;
## −10 ≤ 𝑛 ≤ 20
nc = collect(-10.0:1.0:20.0)
xc = (3.0.*u.(-nc .- 5.0)) .- (2.0.*u.(-nc)) .- (u.(-nc .+ 5.0)) .+ (u.(nc .- 10.0))
xlim([-10.5, 20.5]);
ylim([-3.1, 1.1]);
stem(nc, xc)

## (d) 𝑥[𝑛] = 2sin(0.1π𝑛) + 1.8sin(0.2π𝑛 + 0.25π) + 1.2cos(0.4π𝑛−0.25π), −10 ≤ 𝑛 ≤ 30;
## −10 ≤ 𝑛 ≤ 30
nd = collect(-10.0:1.0:30.0)
xd = (2.0.*sin.(0.1.*π.*nd)) .+ (1.8.*sin.(0.2.*π.*nd .+ 0.25.*π)) .+ (1.2.*cos.(0.4.*π.*nd .- 0.25.*π))
xlim([-10.5, 30.5]);
ylim([-4.0, 4.0]);
stem(nd, xd)

## (e) 𝑥[𝑛] = 0.9^𝑛(𝑢[𝑛] − 𝑢[𝑛−10] + 𝑢[−𝑛+25] − 𝑢[−𝑛+15]),
## −10 ≤ 𝑛 ≤ 30
ne = collect(-10.0:1.0:30.0)
xe = 0.9.^ne.*((u.(ne)) .- (u.(ne.-10)) .+ (u.(-ne.+25)) .- (u.(-ne.+15)))
xlim([-10.5, 30.5]);
ylim([-0.05, 1.05]);
stem(ne, xe)

############################# -> P2.3 <- #########################################################
## Produza os gráficos das seguintes séries periódicas
## (a) 𝑥[𝑛] = {…, 0, −1, 0↑, 1, 0, −1, 0, 1, …}, −10 ≤ 𝑛 ≤ 10;
n = collect(-10:10)
## m1 -> onde começa a amostra de p (zero)
m1 = 0
# amostra
p = [0, 1, 0, -1]
## importante
## formula => x = p[mod.(n .- m1, length(p)) .+ 1]
x = p[mod.(n .- m1, length(p)) .+ 1]
xlim([-10.25, 10.25]);
ylim([-1.05, 1.05]);
stem(n, x)

## (b) 𝑥[𝑛] = {…,𝑥[38],𝑥[39],𝑥[40],𝑥[41],𝑥[42],𝑥[43],𝑥[44],…} = {…,10,0,0,10,0,0,10,…}, −8 ≤ 𝑥 ≤ 12
n = collect(-8:12)
p = [10,0,0]
## m1 -> onde começa a amostra de p (indice)
m1 = 38
x = p[mod.(n .- m1, length(p)) .+ 1]
xlim([-8.25, 12.25]);
ylim([-0.5, 10.5]);
stem(n, x)

############################# -> P2.4 <- #########################################################
##  Calcule manualmente 𝑥[𝑛]∗ℎ[𝑛]:
## (b) 𝑥[𝑛]={0↑, 0, 0, 0, 1, 0, 3}, ℎ[𝑛]={−1, −1, 1, 0↑};
m      |-3|-2|-1| 0| 1| 2| 3| 4| 5| 6| 7| 8|
x[m]   | 0| 0| 0| 0| 0| 0| 0| 1| 0| 3| 0| 0|
h[m]   |-1|-1| 1| 0|  |  |  |  |  |  |  |  |
h[-m]  |  |  |  | 0| 1|-1|-1|  |  |  |  |  |y[0]=0
1      |  |  |  |  | 0| 1|-1|-1|  |  |  |  |y[1]=-1*1 = -1
2      |  |  |  |  |  | 0| 1|-1|-1|  |  |  |y[2]=-1*1 = -1
3      |  |  |  |  |  |  | 0| 1|-1|-1|  |  |y[3]=1*1 + -1*3 = -2 
4      |  |  |  |  |  |  |  | 0| 1|-1|-1|  |y[4]=-1*3 = -3
5      |  |  |  |  |  |  |  |  | 0| 1|-1|-1|y[5]=1*3 = 3
x[n]*h[n] = y[n] = {0↑,-1,-1,-2,-3,3}

############################# -> P2.5 <- #########################################################
## Produza os gráficos de 𝑥[𝑛], ℎ[𝑛] e 𝑥[𝑛] ∗ ℎ[𝑛] em Julia usando a função conv_solve:
function conv_solve(n_x, n_h, x, h)
    l_x, l_h = length(x), length(h)
    l_y = l_x + l_h - 1
    y = Vector{promote_type(eltype(x), eltype(h))}(undef, l_y)
    h = h[end:-1:1]
    for i in 1:l_y
        n_i = max(i, l_h)
        n_f = min(i + l_h - 1, l_y)
        y[i] = sum(x[(n_i:n_f) .- l_h .+ 1].*h[(n_i:n_f) .- i .+ 1])
    end
    n = collect(n_x[1] + n_h[1]:n_x[end] + n_h[end])
    return n, y
end

u(x) = x >= 0 ? 1.0 : 0.0;
δ(x) = x == 0 ? 1.0 : 0.0;

## (a)  𝑥[𝑛] = 3^−𝑛 (𝑢[𝑛 + 1] − 𝑢[𝑛 − 5]),
##      ℎ[𝑛] = 𝑢[𝑛] − 𝑢[𝑛 − 7],
##      −10 ≤ 𝑛 ≤ 15;
n = collect(-10:15)
# 𝑥[𝑛] = 3^−𝑛 (𝑢[𝑛 + 1] − 𝑢[𝑛 − 5])
x = (3.0.^-n) .* (u.(n .+ 1) - u.(n .- 5))
# ℎ[𝑛] = 𝑢[𝑛] − 𝑢[𝑛 − 7]
h = u.(n) - u.(n .- 7)
n_y, y = conv_solve(n, n, x, h)

xlabel("n");
ylabel("x[n]");
xlim([-10.05, 10.05])
ylim([-0.05, 3.05])
stem(n, x)

xlabel("n")
ylabel("h[n]");
xlim([-10.05, 10.05])
ylim([-0.05, 1.05])
stem(n, h)

xlabel("n")
ylabel("x[n]*h[n]");
xlim([-20.05, 30.05])
ylim([-1.05, 5.05])
stem(n_y, y)

## (b) 𝑥[𝑛] = (𝑛/4) (𝑢[𝑛] − 𝑢[𝑛 − 6]),
##     ℎ[𝑛] = 2(𝑢[𝑛 + 2] − 𝑢[𝑛 − 3]),
##     −10 ≤ 𝑛 ≤ 10;
n = collect(-10:10)
x = (n/4.0) .* (u.(n) .- u.(n .-6))   # 𝑥[𝑛] = (𝑛/4) (𝑢[𝑛] − 𝑢[𝑛 − 6])
h = 2.0 .* (u.(n .+ 2) .- u.(n .- 3)) # ℎ[𝑛] = 2(𝑢[𝑛 + 2] − 𝑢[𝑛 − 3])
n_y, y = conv_solve(n, n, x , h)

xlabel("n");
ylabel("x[n]");
xlim([-10.05, 10.05])
ylim([-1.05, 1.55])
stem(n, x)

xlabel("n")
ylabel("h[n]");
xlim([-10.05, 10.05])
ylim([-0.05, 2.05])
stem(n, h)

xlabel("n")
ylabel("x[n]*h[n]");
xlim([-20.05, 20.05])
ylim([-1.05, 8.05])
stem(n_y, y)

## (c) 𝑥[𝑛] = 0.8^𝑛 𝑢[𝑛],
##     ℎ[𝑛] = (−0.9)^𝑛 𝑢[𝑛],
##     −5 ≤ 𝑛 ≤ 55.
n = collect(-5:55)
x = 0.8.^n .* u.(n)     ## 𝑥[𝑛] = 0.8^𝑛 𝑢[𝑛]
h = (-0.9).^n .* u.(n)  ## ℎ[𝑛] = (−0.9)^𝑛 𝑢[𝑛]
n_y, y = conv_solve(n, n, x , h)

xlabel("n");
ylabel("x[n]");
xlim([-5.0, 60.05])
ylim([-0.05, 1.05])
stem(n, x)

xlabel("n")
ylabel("h[n]");
xlim([-5.0, 60.05])
ylim([-1.05, 1.05])
stem(n, h)


xlabel("n")
ylabel("x[n]*h[n]");
xlim([-5.0, 100.05])
ylim([-0.25, 1.05])
stem(n_y, y)

############################# -> P2.6 <- #########################################################
##  Considere que a equação diferencial 𝑦[𝑛] − 𝑦[𝑛 − 1] + 0.5𝑦[𝑛 − 2] = 2𝑥[𝑛] − 𝑥[𝑛 − 1]
##  representa um sistema 𝐻. Assumindo que o sistema se encontra inicialmente em repouso,
##  determine manualmente a resposta do sistema 𝐻 às seguintes excitações:
# (a) 𝑥[𝑛] = 2𝛿[𝑛] − 2𝛿[𝑛 − 1], −1 ≤ 𝑛 ≤ 10;
# 1º simplificar ( 𝑦[𝑛] − 𝑦[𝑛 − 1] + 0.5𝑦[𝑛 − 2] = 2𝑥[𝑛] − 𝑥[𝑛 − 1] )
# 𝑦[𝑛] = 2𝑥[𝑛] − 𝑥[𝑛 − 1] + 𝑦[𝑛 − 1] − 0.5𝑦[𝑛 − 2]
# 2º para descobrir o vetor x[] (𝑥[𝑛] = 2𝛿[𝑛] − 2𝛿[𝑛 − 1], −1 ≤ 𝑛 ≤ 10;)
u(x) = x >= 0 ? 1.0 : 0.0;
δ(x) = x == 0 ? 1.0 : 0.0;
n = collect(-1:10)
x = 2 .* δ.(n) - 2 .* δ.(n .- 1)
println(x)
# x[n] = [0.0, 2.0↑, -2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
#        [-1,   0,    1,   2,   3,   4,   5,   6,   7,   8,   9,  10 ] -> posicoes
# 3º (assumimos de de y[0, -1, -2, -3, ...] = 0) (e começamos a descobrir o y[n] novos)
# n = -1 -> y[-1] = 2x[-1] - x[-2] + y[-2] - 0.5y[-3] = 2 x 0 - 0 + 0 - 0.5 x 0 = 0 = y[-1]
# n = 0 -> y[0] = 2x[0] - x[-1] + y[-1] - 0.5y[-2] = 2 x 2 - 0 + 0 - 0.5 x 0 = 4 = y[0]
# n = 1 -> y[1] = 2x[1] - x[0] + y[0] - 0.5y[-1] = 2 x (-2) - 2 + 4 - 0.5 x 0 = -2 = y[1]
# n = 2 -> y[2] = 2x[2] - x[1] + y[1] - 0.5y[0] = 2 x 0 - (-2) + (-2) - 0.5 x 4 = -2 = y[2]
# n = 3 -> y[3] = 2x[3] - x[2] + y[2] - 0.5y[1] = 2 x 0 - 0 + (-2) - 0.5 x (-2) = -1 = y[3]
# n = 4 -> y[4] = 2x[4] - x[3] + y[3] - 0.5y[2] = 2 x 0 - 0 + (-1) - 0.5 x (-2) = 0 = y[4]
# .
# até n = 10
# resultado
# 𝑦[𝑛] = {0, 4↑, −2, −2, −1, 0, 0.5, 0.5, 0.25, 0, −0.125, −0.125}
#      = {4↑, −2, −2, −1, 0, 0.5, 0.5, 0.25, 0, −0.125, −0.125}

############################# -> P2.7 <- #########################################################
function diff_solve(x, α, β)
    # x = vetor excitação
    # α = vetor com coeficientes α_0, α_1, α_2, ..., α_M
    # β = vetor com coeficientes β_0, β_1, β_2, ..., β_P
    M = length(α) - 1
    P = length(β) - 1
    l_x = length(x)
    T = promote_type(Float64, eltype(x))
    x = [zeros(T, M); x]
    y = [zeros(T, P); Vector{T}(undef, l_x)]
    for i in 1:l_x
        y[i + P] = 1/β[1]*(sum(α.*x[i + M:-1:i]) - sum(β[2:end].*y[i + P - 1:-1:i]))
    end
    return y[P + 1:end]
end
## Utilizando a função diff_solve em Julia, produza o gráfico da resposta 𝑦[𝑛] de um sistema representado pela equação
## 𝑦[𝑛] − 0.7𝑦[𝑛 − 1] + 0.1𝑦[𝑛 − 2] = 2𝑥[𝑛] − 𝑥[𝑛 − 2] à excitação 𝑥[𝑛] = 5^−𝑛 * 𝑢[𝑛],
## para −10 ≤ 𝑛 ≤ 20, assumindo que o sistema está inicialmente em repouso. Esboce o diagrama de blocos do sistema.
## DADOS
## 𝑦[𝑛] = 2𝑥[𝑛] − 𝑥[𝑛 − 2] − (−0.7𝑦[𝑛 − 1] + 0.1𝑦[𝑛 − 2])
# valores de alpha e beta talvez sejam retirados de y[n]?? (vetor alpha dados em x, e vetor beta dados em y)
## 𝛼 = {2,0,−1}; ## 𝛽 = {1,0.7,−0.1}; ## 𝑥0 = {0,0}; ## 𝑦0 = {0,0}

n = collect(-10:20)
## x -> sinal de entrada (vetores x e y têm o mesmo comprimento)
## x = (n -> n == 0 ? 1.0 : 0.0).(n);   # impulso ou degrau
## neste caso temos uma excitação 𝑥[𝑛] = 5^−𝑛 * 𝑢[𝑛]
x = (k -> k >= 0 ? 5.0^-k : 0.0).(n);
## α –> vetor (comprimento = 𝑀 + 1) dos coeficientes da variável independente (dado?)
α = [2.0, 0.0, -1.0]
## β –> vetor (comprimento = 𝑃 + 1) dos coeficientes da variável dependente  (dado?)
# β = [1.0, 0.7, -0.1] -> alterado pelo prof?
β = [1.0, -0.7, 0.1];
# dado: nao utilizado com a nova versão do diff_solve()
x_0 = [0.0, 0.0]
y_0 = [0.0, 0.0]
## y –> sinal de saída (solução da equação de diferenças lineares)
## (o tipo dos elementos de y é o mesmo que o dos elementos de x)
y = diff_solve(x, α, β)

xlabel("n");
ylabel("x[n]");
xlim([-10.05, 20.05])
ylim([0, 1.05])
stem(n, x)

xlabel("n");
ylabel("y[n]");
xlim([-10.05, 20.05])
ylim([-0.55, 2.05])
stem(n, y)

#################################### -> P2.8 <- #################################################
## Utilizando a função diff_solve em Julia, produza o gráfico da resposta impulsional
## ℎ[𝑛] = 𝑦[𝑛] de um sistema representado pela equação
## 𝑦[𝑛] − 0.2𝑦[𝑛 − 1] + 0.6𝑦[𝑛 − 2] = 𝑥[𝑛[+0.5𝑥[𝑛 − 1], para −5 ≤ 𝑛 ≤ 25,
## assumindo que o sistema está inicialmente em repouso. Esboce o diagrama de blocos do sistema.
## DADOS
## 𝑦[𝑛] = 𝑥[𝑛[+0.5𝑥[𝑛 − 1] − (−0.2𝑦[𝑛 − 1] + 0.6𝑦[𝑛 − 2])
# valores de alpha e beta talvez sejam retirados de y[n]?? (vetor alpha dados em x, e vetor beta dados em y)
## 𝛼 = {1,0.5}; ## 𝛽 = {1,0.2,−0.6}; ## 𝑥0 = {0,0}; ## 𝑦0 = {0,0};


n = collect(-5:25)
## x = (n -> n == 0 ? 1.0 : 0.0).(n);   # impulso ou degrau
x = (k -> k == 0 ? 1.0 : 0.0).(n);
α = [1.0, 0.5]
β = [1.0, -0.2, 0.6];
# β = [1.0, 0.2, -0.6]
x_0 = [0.0, 0.0]
y_0 = [0.0, 0.0]
h = diff_solve(x, α, β)

ylabel("x[n]");
xlim([-5.05, 20.05])
ylim([-0.05, 1.05])
stem(n, x)

xlabel("n");
ylabel("h[n]");
xlim([-2.05, 20.05])
ylim([-1.05, 2.05])
stem(n, h)

########################## -> P2.9 <- #######################################
## Utilizando a função diff_solve em Julia, produza o gráfico da resposta
## 𝑠[𝑛] = 𝑦[𝑛] ao degrau unitário 𝑢[𝑛] de um sistema representado pela
## equação 2𝑦[𝑛] − 𝑦[𝑛 − 1] − 4𝑦[𝑛 − 3] = 𝑥[𝑛[+3𝑥[𝑛 − 5], para −5 ≤ 𝑛 ≤ 25,
## assumindo que o sistema está inicialmente em repouso.
## Esboce o diagrama de blocos do sistema.
## DADOS
## 𝑦[𝑛] = 1/2 [𝑥[𝑛] + 3𝑥[𝑛 − 5] − (−𝑦[𝑛 − 1] − 4𝑦[𝑛 − 3])]
## 𝛼 = {1,0,0,0,0,3}; ## 𝛽 = {2,−1,0,−4}; ## 𝑥0 = {0,0,0,0,0,0}; ## 𝑦0 = {0,0,0}

n = collect(-5:25)
## degrau
x = (k -> k >= 0 ? 1.0 : 0.0).(n);
α = [1.0, 0.0, 0.0, 0.0, 0.0, 3.0]
β = [2.0, -1.0, 0.0, -4.0]
x_0 = zeros(6)
y_0 = zeros(3)
s  = diff_solve(x, α, β)

xlabel("n");
ylabel("x[n]");
xlim([-5.05, 25.05])
ylim([-0.05, 1.05])
stem(n, x)

xlabel("n");
ylabel("s[n]");
xlim([-5.05, 25.05])
ylim([-0.05, 8000])
stem(n, s)

################## 3. ANÁLISE DISCRETA DE FOURIER#################################
########################################### -> P3.1 <- ###########################
## Determine os coeficientes da série de Fourier dos seguintes sinais periódicos:
## (a) 𝑥[𝑛] = {  1 𝑘 ≤ 𝑛 ≤ 3 + 𝑘        , 𝑘 = 0, ±1, ±2, …;
##            {  2 4 + 𝑘 ≤ 𝑛 ≤ 7 + 𝑘
## n <= 7 -> N = 8 (N = tamanho da amostra)
N = 8
## neste passo -> n = collect(0:(2*N-1))
n = collect(-2: 17)
x = [1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 2.0][mod.(n, N) .+ 1]

xlim([-2.25, 17.25])
ylim([-0.05, 2.05])
xlabel("n")
ylabel("x[n]")
stem(n, x)

## calcular os quoficientes
## ω0 -> fixo
ω0 = 2 * π /N
## neste passo -> n = collect(0:(N - 1))
n = collect(0:(N - 1))
x = [1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 2.0]
# formula
a = [1/N * sum(x .* exp.(-im * k * ω0 * n)) for k in 0:N - 1];
println(round.(real(a), digits = 4))
println(round.(imag(a), digits = 4))

## (b) 𝑥[𝑛] = {…, 0.8, 1, 0↑, 0.2, 0.4, 0.6, 0.8, 1, 0, 0.2,…}
## tamanho da amostra
N = 6
## neste passo -> n = collect(0:(2*N-1))
n = collect(-2:13)
x = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0][mod.(n, N) .+ 1]

xlim([-2.25, 13.25]);
ylim([-0.05, 1.05]);
xlabel("n");
ylabel("x[n]");
stem(n, x)

## calcular os quoficientes
ω0 = 2 * π /N
## neste passo -> n = collect(0:(N - 1))
n = collect(0:(N - 1))
x = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
# formula
a = [1/N * sum(x .* exp.(-im * k * ω0 * n)) for k in 0:N - 1];
println(round.(real(a), digits = 4))
println(round.(imag(a), digits = 4))

## (c) 𝑥[𝑛]={…, 0, 0.5, 1↑, 0.5, 0, −0.5, −1, −0.5, 0, 0.5, 1, 0.5, …}
N = 8
n = collect(-2:17)
x = [1, 0.5, 0, -0.5, -1, -0.5, 0, 0.5][mod.(n, N) .+ 1]
xlim([-2.25, 17.25])
ylim([-1.05, 1.05])
xlabel("n")
ylabel("x[n]")
stem(n, x)

## calcular os quoficientes
ω0 = 2 * π /N
## neste passo -> n = collect(0:(N - 1))
n = collect(0:(N - 1))
x = [1, 0.5, 0, -0.5, -1, -0.5, 0, 0.5]
# formula
a = [1/N * sum(x .* exp.(-im * k * ω0 * n)) for k in 0:N - 1];
println(round.(real(a), digits = 4))
println(round.(imag(a), digits = 4))

## (d) 𝑥[𝑛] = cos(0.5π𝑛) + cos(0.25π𝑛 − 0.125π)
f(n) = cos(0.5*π*n) + cos(0.25*π*n - 0.125*π);
## 0.25 vêm do sinal -> 2/0.25 = 8
## N = ω0 / 2π = max(2π/0.5π, 2π/0.25π) = (4, 8) = 8
N = 2/0.25;

## n = collect(0:(2*N-1))
n = collect(-2:(2*N-1)) # (0:(2*N-1))
## println(n1)
## teste
## n2 = collect(-2:17)
## println(n2)

x = f.(n)
xlim([-3.25, 17.25]);
ylim([-2.05, 2.05]);
xlabel("n");
ylabel("x[n]");
stem(n, x)

## calcular os quoficientes
ω0 = 2 * π /N
n = collect(0:(N - 1))
x = f.(n)
# formula
a = [1/N * sum(x .* exp.(-im * k * ω0 * n)) for k in 0:N - 1];
println(round.(real(a), digits = 4))
println(round.(imag(a), digits = 4))

########################################## -> P3.2 <- ##################################
## Determine as séries numéricas cujas séries de Fourier têm os seguintes coeficientes:
##  (a) 𝑎0 = 𝑎1 = 𝑎2 = 𝑎3 = 𝑎4 = 0.2 (𝑁 = 5)
N = 5        # dado
## fixo -> ω₀ = 2*π/N;
ω₀ = 2*π/N;
n = collect(-2:(2*N + 1));
## fill(0.2, 3) = [0.2, 0.2, 0.2] -> vetor de 0.2 com tamanho igual ao segundo parametro
## vetor com os valores e a0,a1, a2, a3, ...
a = fill(0.2, 5);
## fixo -> φ = [exp.(im*k*ω₀*n) for k in 0:N - 1];
φ = [exp.(im * k * ω₀ * n) for k in 0:(N - 1)];
## fixo -> x = real(sum([a[k + 1]*φ[k + 1] for k in 0:N - 1]));
x = real(sum([a[k + 1]*φ[k + 1] for k in 0:(N - 1)]));
xlim([-2.25, 11.25]);
ylim([-0.02, 1.02]);
xlabel("n");
ylabel("x[n]");
stem(n, x)

## (b) 𝑎0 = 0.8, 𝑎1 = 𝑎2 = 𝑎3 = 𝑎4 = −0.2 (𝑁 = 5);
N = 5;
ω₀ = 2*π/N;
n = collect(-2:(2*N + 1));
## vetor com os valores e a0,a1, a2, a3, ...
a = [0.8; fill(-0.2, 5)];
φ = [exp.(im*k*ω₀*n) for k in 0:N - 1];
x = real(sum([a[k + 1]*φ[k + 1] for k in 0:N - 1]));
xlim([-2.25, 11.25]);
ylim([-0.02, 1.02]);
xlabel("n");
ylabel("x[n]");
stem(n, x)

## (c) 𝑎0 = 2.5, 𝑎1 = (5/3)e^j(π/3), 𝑎2 = 0, 𝑎3 = 5/6 , 𝑎4 = 0, 𝑎5 = (5/3)e^−j(π/3) (𝑁 = 6);
N = 6
ω₀ = 2*π/N;
n = collect(-2:2*N + 1);
## vetor com os valores e a0,a1, a2, a3, ...
a = [2.5, 5/3*exp(im*(π/3)), 0.0, 5/6, 0.0, 5/3*exp(-im*(π/3))]
φ = [exp.(im*k*ω₀*n) for k in 0:N - 1];
x = real(sum([a[k + 1]*φ[k + 1] for k in 0:N - 1]));
xlim([-2.25, 13.25]);
ylim([-0.1, 5.1]);
xlabel("n");
ylabel("x[n]");
stem(n, x)

## (d) 𝑎0 = 1.714, 𝑎1 = 0.65 − 𝑗0.313, 𝑎2 = −0.027 + 𝑗0.034, 𝑎3 = 0.02 − 𝑗0.09, 𝑎4 = 0.02 + 𝑗0.09,
## 𝑎5 = −0.027 − j0.034, 𝑎6 = 0.65 + j0.313 (𝑁 = 7);
N = 7
ω₀ = 2*π/N;  # fixo
n = collect(-2:(2*N + 1));
## a = [a0, a1, a2, a...]
a = [1.714, (0.65 - im*0.313), (-0.027 + im*0.034), (0.02 - im*0.09), (0.02 + im*0.09), (-0.027 - im*0.034), (0.65 + im*0.313)]
φ = [exp.(im*k*ω₀*n) for k in 0:N - 1];
x = real(sum([a[k + 1]*φ[k + 1] for k in 0:N - 1]));
xlim([-2.25, 15.25]);
ylim([-0.1, 3.1]);
xlabel("n");
ylabel("x[n]");
stem(n, x)

################################### -> P3.3_1 <- ##########################
## Determine a resposta do sistema do sistema 𝐻, cuja resposta impulsional
## é ℎ[𝑛] = {8↑, 8, 7, 6, 4, 2, 0.5},
## ao sinal 𝑥[𝑛] = sin(0.25π𝑛) + cos(0.5π𝑛 + 0.125π), −10 ≤ 𝑛 ≤ 20

# N = max(2π/0.25π, 2π/0.5π) = 8
N = 8;
## h[n]
## h = [8, 8, 7, 6, 4, 2, 0.5]
h = [8, 12, 7, 2, 0, -1, -0.5, 0, 0.5]
## fixo
H = [sum(h[m + 1]*exp(-im*k*2*π/N*m) for m in 0:N) for k in 0:N - 1];
## fixo
n = collect(0:(N - 1));

# 𝑥[𝑛] = sin(0.25π𝑛) + cos(0.5π𝑛 + 0.125π)
x = (n -> sin(0.25*π*n) + cos(0.5*π*n + 0.125*π)).(n);
# vetor x de cima, vai ser usado para calcular vetor 'a' de baixo
a = [1/N*sum(x.*exp.(-im*k*2*π/N*n)) for k in 0:N - 1];
b = a.*H; n = collect(-10:20);

x = x[mod.(n, N) .+ 1];
y = sum(b[k + 1]*exp.(im*k*2*π/N*n) for k in 0:N - 1);

xlabel("n");
ylabel("x[n]");
xlim([-10.25, 20.25]);
ylim([-2.25, 1.25]);
stem(n, x)

xlabel("n");
ylabel("y[n]");
xlim([-10.25, 20.25]);
ylim([-40.25, 20.25]);
stem(n, real(y))

########################### -> P3.3_2 <- ####################################
## Determine a resposta do sistema do sistema 𝐻, cuja resposta impulsional
## é ℎ[𝑛] = {5,4,3,2,1,0,−0.5,−0.25},
## ao sinal periódico 𝑥[𝑛] = {…,−1,−1,1↑ ,1,1,−1,−1,−1,1,1,…}, 0≤ 𝑛 ≤ 17.
h = [5, 4, 3, 2, 1, 0, -0.5, -0.25]        # ℎ[𝑛] = {5,4,3,2,1,0,−0.5,−0.25}
# M é o tamanho do vetor h?
M = 8
x = [1,1,1,-1,-1,-1]  # amostrta x[n]
N = 6                 # tamanho da amostra de x

ω₀ = 2*π/N;
H = [sum(h[m + 1]*exp(-im * k * ω₀ * m) for m in 0:M - 1) for k in 0:N - 1];

n = collect(0: (N-1))
a = [1/N*sum(x.*exp.(-im * k * ω₀ * n)) for k in 0:N - 1];
b = a.*H;

n = collect(0:17);
x = x[mod.(n, N) .+ 1];
y = sum(b[k + 1]*exp.(im * k * ω₀ * n) for k in 0:N - 1);

xlabel("n");
ylabel("x[n]");
xlim([-0.25, 20.25]);
ylim([-1.05, 1.05]);
stem(n, x)

xlabel("n");
ylabel("y[n]");
xlim([-0.25, 20.25]);
ylim([-10.25, 10.25]);
stem(n, real(y))

################################### -> P3.4 <- ########################
## Determine a transformada discreta de Fourier para o sinal
## 𝑥[𝑛] = {1, 2↑, 3, 4, 5}
## para 301 pontos equidistantes entre 0 e π e produza gráficos
## da magnitude e do ângulo do resultado da transformada.

## fixo
dft(ω, n, x) = sum(x.*exp.(-im * ω * n));

n = collect(-1:3);
## tamanho de x[n]
x = collect(1:5);
## 301 pontos
ω = collect(0:300)*π/300;
X = dft.(ω, (n,), (x,));

xlabel("\\omega/\\pi");
ylabel("abs(X)");
xlim([-0.05, 1.05]);
ylim([-0.05, 15.05]);
plot(ω/π, abs.(X))

xlabel("\\omega/\\pi");
ylabel("angle(X)");
ylim([-4.05, 4.05]);
plot(ω/π, angle.(X))

####################################### -> P3.5 <- ####################
## Determine a transformada discreta de Fourier para o sinal
## 𝑥[𝑛] = 0.9^𝑛, −10 ≤ 𝑛 ≤ 10, para 401 pontos
## equidistantes entre −π e π e produza gráficos da magnitude
## e do ângulo do resultado da transformada.

n = collect(-10:10)       # −10 ≤ 𝑛 ≤ 10
x = (n -> 0.9^n).(n);     # 𝑥[𝑛] = 0.9^𝑛
## 401 pontos
ω = collect(-200:200)*π/200;
X = dft.(ω, (n,), (x,));

xlabel("\\omega/\\pi");
ylabel("abs(X)");
xlim([-1.05, 1.05]);
ylim([-1.05, 30.05]);
plot(ω/π, abs.(X))

xlabel("\\omega/\\pi");
ylabel("angle(X)");
xlim([-1.05, 1.05]);
ylim([-4.05, 4.05]);
plot(ω/π, angle.(X))


