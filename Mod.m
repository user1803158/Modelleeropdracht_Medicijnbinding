function [c] = sim(t, r0, kel, koff)

    [X1, X2] = meshgrid(-5:0.5:5)
    
    xs = arrayfun(@(x,y) {odeFun([],[x,y])}, X1, X2);
    ms = cellfun(@(x) x(1), xs);
    cs = cellfun(@(x) x(2), xs);
    
    quiver(ms, cs)
    xlabel('m')
    ylabel('c')
    axis tight equal;
    
    function [dmdt, dcdt] = odeFun(r0, kel, koff)
        dmdt = -m*(r0-c) + c - kel/koff * m;
        dcdt = m*(r0-c) - c;
    end
end 