function inverse(f)
    g = zeros(Int64, length(f))
    for i in eachindex(g)
        g[i] = findfirst(isequal(i),f)
    end
    g
end

function composition(f,g)
    h = zeros(Int64,length(f))
    for i in eachindex(h)
        h[i] = f[g[i]]
    end
    h
end