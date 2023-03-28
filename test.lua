function bb(a)
    return a + math.random(1000)
end

function aa()
    a = 1
    for i = 1, 3000000 do
        bb(i)
    end
end

function ff()
    aa()
end

ff()
