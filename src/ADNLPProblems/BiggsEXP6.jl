export BiggsEXP6

function BiggsEXP6()
	z = [i/10 for i in 1:13]
	y = [exp(-zi) - 5*exp(-10*zi) + 3*exp(-4*zi) for zi in z]
	BiggsEXP6(x) = sum([x[3]*exp(-x[1]*z[i]) - x[4]*exp(-x[2]*z[i]) + x[6]*exp(-x[5]*z[i]) - y[i] for i in 1:13])
	model = ADNLPModel(BiggsEXP6, ones(6))
	return model
end

