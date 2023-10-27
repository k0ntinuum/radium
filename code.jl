function encode(p,q)
    k = copy(q)
    n = size(k)[begin]
    c = zeros(Int64,length(p))
    for i in eachindex(p)
        f = getf(k)
        g = getg(k)
        if isodd(i)
            h = composition(f,g)
        else
            h = composition(g,f)        
        end
        
        c[i] = h[p[i]]
        f = circshift(f,p[i])
        g = circshift(g,c[i])
        # printvec(f,alph_letters)
        # printvec(g,alph_letters)
        for j in 1:n
            k[j,:] = circshift(k[j,:],f[j] )
        end
        for j in 1:n
            k[:,j] = circshift(k[:,j],g[j] )
        end
        # printkey(k,alph_letters)
    end
    c
end
function demoencode(p,q, F)
    k = copy(q)
    n = size(k)[begin]
    c = zeros(Int64,length(p))
    for i in eachindex(p)
        f = getf(k)
        g = getg(k)
        if isodd(i)
            h = composition(f,g)
        else
            h = composition(g,f)        
        end
        push!(F,h)
        c[i] = h[p[i]]
        f = circshift(f,p[i])
        g = circshift(g,c[i])
        # printvec(f,alph_letters)
        # printvec(g,alph_letters)
        for j in 1:n
            k[j,:] = circshift(k[j,:],f[j] )
        end
        for j in 1:n
            k[:,j] = circshift(k[:,j],g[j] )
        end
        # printkey(k,alph_letters)
    end
    c
end

function decode(c,q)
    k = copy(q)
    n = size(k)[begin]
    p = zeros(Int64,length(c))
    for i in eachindex(c)
        f = getf(k)
        g = getg(k)
        if isodd(i)
            h = composition(f,g)
        else
            h = composition(g,f)        
        end
        hinv = inverse(h)
        p[i] = hinv[c[i]]
        f = circshift(f,p[i])
        g = circshift(g,c[i])
        for j in 1:n
            k[j,:] = circshift(k[j,:],f[j] )
        end
        for j in 1:n
            k[:,j] = circshift(k[:,j],g[j] )
        end 
    end
    p
end
