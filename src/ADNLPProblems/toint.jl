export toint

function toint(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
	function f(x; n = length(x))
		s = zero(T)
		for i ∈ 1:n
			ci = 1 + i / 10
			jmin = max(1, i - 2)
			jmax = min(n, i + 2)
			for j ∈ jmin:jmax
				aij = 5 * (1 + mod(i, 5) + mod(j, 5))
				bij = (i + j) / 10
				cj = 1 + j / 10
				s += aij * sin(bij + ci * x[i] + cj * x[j])
			end

			if iseven(n)
				half = n ÷ 2
				j1 = i + half
				if 1 <= j1 <= n && (j1 < jmin || j1 > jmax)
					aij = 5 * (1 + mod(i, 5) + mod(j1, 5))
					bij = (i + j1) / 10
					cj = 1 + j1 / 10
					s += aij * sin(bij + ci * x[i] + cj * x[j1])
				end
				j2 = i - half
				if 1 <= j2 <= n && j2 != j1 && (j2 < jmin || j2 > jmax)
					aij = 5 * (1 + mod(i, 5) + mod(j2, 5))
					bij = (i + j2) / 10
					cj = 1 + j2 / 10
					s += aij * sin(bij + ci * x[i] + cj * x[j2])
				end
			end
		end
		return s / n
	end

	x0 = fill(one(T), n)
	return ADNLPModels.ADNLPModel(f, x0, name = "toint"; kwargs...)
end
