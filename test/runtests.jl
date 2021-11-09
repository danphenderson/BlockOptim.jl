using Test, LinearAlgebra, ForwardDiff

import Statistics: mean

import Parameters: @unpack

# import Util Types
import BlockOpt:  @lencheck, DimensionError,  @contract, ContractError,  @restrict, AccessError


 # BlockOpt Types
import BlockOpt: BlockOptBackend, Model, Driver, DriverOptions, Weaver, EvaluationCounter,
    EvaluationCounter, BlockOptProfile, BlockOptTrace, Simulation 


# Model imports
import BlockOpt: name, obj, grad!, grad, objective, gradient, initial_iterate, formula,
    dimension, directory, objective!, gradient!, initial_iterate!, formula!, final,
    hess_sample, hessAD


# DriverOptions imports
import BlockOpt: samples, Δ_max, δ_tol, ϵ_tol, max_iterations, weave_level, log_level,
    samples!, Δ_max!, δ_tol!, ϵ_tol!, max_iterations!, weave_level!, log_level!,
    LogLevel, INFO, DEBUG, WARN, ERROR, WeaveLevel, NONE, ALL


# Driver imports
import BlockOpt: orth, pflag, QN_update, SR1, PSB, S_update, A, B, C, D, E, F


# Timer imports
import BlockOpt: EvaluationTimer, Δt, on!, off!


# Counter imports
import BlockOpt: evaluations, increment!


# Profile imports
import BlockOpt: profile, trs_timer, trs_counter, ghs_timer, ghs_counter


# Weaver imports 
import BlockOpt: weaver, weave!, f_vals, ∇f_norms, Δ_vals, p_norms, ρ_vals


# BlockOptTrace imports 
import BlockOpt: model, driver, profile, log_level, directory, io, 
    info!, debug!, warn!, error!


# Backend imports
import BlockOpt: fₖ, ∇fₖ_norm, pₖ_norm, Δₖ, ρ, model, driver, terminal, secantQN,
    blockQN, update_Sₖ, build_trs, solve_trs, build_trial, update_Δₖ, accept_trial,
    gAD, gHS, initialize


# Simulation imports
import BlockOpt: trace, backend, optimize!, optimize


include("setup.jl")


@testset "Utilities      (See File test/util.jl)   " begin 
    include("util.jl");
end


function main()
    return BlockOptBackend(test_model, test_driver)
end


@testset "Library        (See Directory: test/lib/)" begin
    include("lib/model.jl")

    include("lib/options.jl")

    include("lib/driver.jl")

    include("lib/trace.jl")

    include("lib/backend.jl")

    include("lib/simulation.jl");
end