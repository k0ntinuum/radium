function randomkey(n)
    k = zeros(Int64, n, n)
    for i in 1:n
        k[i,:] = Random.randperm(n)
    end
    k
end

function getf(q)
    k = reshape(transpose(q), :, 1)
    #printvec(k,alph_numbers)
    f = zeros(Int64,size(q)[begin])
    i = 1
    for v in k
        if ! (v in f)
            f[i] = v
            i = i + 1
        end
    end
    f
end

function getg(q)
    k = reverse(reshape(transpose(q), :, 1))
    #printvec(k,alph_numbers)
    g = zeros(Int64,size(q)[begin])
    i = 1
    for v in k
        if ! (v in g)
            g[i] = v
            i = i + 1
        end
    end
    g
end

function spin(q,r)
    k = copy(q)
    n = size(k)[begin]
    for i in 1:r
        f = getf(k)
        g = getg(k)
        for j in 1:n
            k[j,:] = circshift(q[j,:],f[j] )
        end
        for j in 1:n
            k[:,j] = circshift(q[:,j],g[j] )
        end
    end
    k
end

