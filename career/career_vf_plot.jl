#=
Shows

@author : Spencer Lyon <spencer.lyon@nyu.edu>

@date: 2014-08-05

References
----------

http://quant-econ.net/career.html
=#
using PyPlot
using QuantEcon

include("career.jl")

srand(41)  # reproducible results
wp = CareerWorkerProblem()
v_init = fill(100.0, wp.N, wp.N)
func(x) = bellman_operator(wp, x)
v = compute_fixed_point(func, v_init, max_iter=500, verbose=false)

fig = figure(figsize=(8,6))
ax = fig[:add_subplot](111, projection="3d")
tg, eg = meshgrid(wp.theta, wp.epsilon)

ax[:plot_surface](tg, eg, v', rstride=2, cstride=2,
                cmap=ColorMap("jet"),
                alpha=0.5,
                linewidth=0.25)

ax[:set_zlim](150, 200)
ax[:set_xlabel]("theta", fontsize=14)
ax[:set_ylabel]("epsilon", fontsize=14)
