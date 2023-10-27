function vecfromstring(s,alph)
    n = length(s)
    v = zeros(Int64,n)
    for i in 1:n
        v[i] = findfirst(isequal(s[i]),alph)
    end
    v
end

function demo()
    n = 27
    k = randomkey(n)
    r = 3
    alph = alph_letters
    @printf "random key\n"
    printkey(k,alph_letters)
    #p = Random.randperm(n)
    p = vecfromstring("THIS_IS_THE_RADIUM_SYMMETRIC_CRYPTO_SYSTEM",alph)
    #p = Random.randperm(n)
    c = demoencrypt(p,k,r,alph)
    d = demodecrypt(c,k,r,alph)
    if p != d @printf "ERROR\n\n" else @printf "SUCCESS\n\n" end
    printvec(p,alph)
    printvec(c,alph)
    printvec(d,alph)

end
function demo(n)
    k = randomkey(n)
    r = 100
    alph = alph_letters
    @printf "random key\n"
    printkey(k,alph_letters)
    p = Random.randperm(n)
    #p = Random.randperm(n)
    c = demoencrypt(p,k,r,alph)
    d = demodecrypt(c,k,r,alph)
    if p != d @printf "ERROR\n\n" else @printf "SUCCESS\n\n" end
    printvec(p,alph)
    printvec(c,alph)
    printvec(d,alph)

end

function test(n)
    k = randomkey(n)
    alph = alph_letters
    @printf "random key\n"
    printkey(k,alph_letters)
    p = Random.randperm(n)

    c = encode(p,k)
    #print(c)
    @printf "encoding success\n\n"
    printvec(c,alph)
    d = decode(c,k)
    @printf "decoding success\n\n"
    printvec(p,alph)
    printvec(c,alph)
    printvec(d,alph)
    if p != d @printf "ERROR" end
end
