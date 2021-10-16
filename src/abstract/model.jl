"""
    AbstractModel{T<:Real, S<:AbstractArray} <: AbstractBlockOptType

    Defines the interfaced base type of an optimization Abstractmodel.

    A subtype of AbstractModel{T,S} impements:
        [`obj`](@ref)
        [`grad!`](@ref)
        [`name!`](@ref)
        [`formula!`](@ref)
        [`initial_iterate!`](@ref)
        [`dimension`](@ref)
        [`name`](@ref)
        [`formula`](@ref)
        [`initial_iterate`](@ref)

    # TODO: Add reference to implementation 
"""
abstract type AbstractModel{T<:Real, S<:AbstractArray} <: AbstractBlockOptType end


"""
    objective!(m::AbstractModel, x::AbstractArray)

    Assign `f` as the objective function of model `m`.
"""
objective!(m::AbstractModel, f::Function) = @contract AbstractModel :obj


"""
    gradient!(m::AbstractModel, ∇f!::Function)
    
    Assign ``∇f!`` as the gradient function of model `m`.
    
    The input ``∇f!`` is in-place, meaning ``∇f!(g, x)`` stores the steepest-descent direction
    at `x` in the place of `g`.
"""
gradient!(m::AbstractModel, ∇f!::Function) = @contract AbstractModel :grad!


"""
    initial_iterate!(m::AbstractModel, x0::AbstractArray)

    Assign `x0` as the initial iterate of model `m`.
"""
initial_iterate!(m::AbstractModel, x0::AbstractArray) = @contract AbstractModel :initial_iterate!


"""
    formula!(m::AbstractModel, s::AbstractString)

    Assign `s` as the formula of model `m`.
"""
formula!(m::AbstractModel, formula::AbstractString) = @contract AbstractModel :formula


"""
    objective(m::AbstractModel)

    The objective function of model `m`.
"""
objective(m::AbstractModel) = @contract AbstractModel :objective


"""
    gradient(m::AbstractModel)

    The gradient function of model `m`.
"""
gradient(m::AbstractModel) = @contract AbstractModel :gradient


"""
    dimension(m::AbstractModel)

    The dimension of model `m`.
"""
dimension(m::AbstractModel) = @contract AbstractModel :dimension


"""
    formula(m::AbstractModel)

    The formula of model `m`.
"""
formula(m::AbstractModel) = @contract AbstractModel :name


"""
    record(m::AbstractModel)::AbstractModelRecord

    The record of model `m`.
"""
record(m::AbstractModel)::AbstractModelRecord = @contract AbstractModel :record


# Forward AbstractModelRecord Inherited Behavior
log(m::AbstractModel) = log(record(m))


log!(m::AbstractModel, p) = log!(record(m), p)