module LintCompat

export BROADCAST, flatten

# TODO: remove when 0.5 support dropped
function BROADCAST(f, x::Union{T, Nothing}) where {T}
    if x == nothing
        nothing
    else
        f(x)
    end
end

# TODO: move to a different repository
"""
    flatten(f, x::Nullable{<:Nullable}) :: Nullable

Unwrap one layer of a two-layed `Nullable` object.

Often combined with broadcast as in `flatten(broadcast(f, x))`, which is like
`broadcast(f, x)`, except returns the result of `f` directly. Expects `f` to
return a `Nullable` value.
"""
function flatten(x::Union{Union{T, Nothing}, Nothing}) where {T}
    if x == nothing
        nothing
    else
        x
    end
end

# fallback method for e.g. Nullable{Any}, Nullable{Union{}}
function flatten(x::Union{T, Nothing}) where {T}
    if x == nothing
        nothing
    else
        x :: Union{T, Nothing}
    end
end

end
