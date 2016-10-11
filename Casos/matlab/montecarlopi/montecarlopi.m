function montecarlo()
   mmm(4000) 
end

function piEstimate = mmm(numDarts)
 
    piEstimate = 4*sum( sum(rand(numDarts,2).^2,2) <= 1 )/numDarts;
 
end

