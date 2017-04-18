RATING_CONST = 173.7178
RATING_DEFAULT = 1500.0
T = 1.2

def scale_rating(r)
  (r - RATING_DEFAULT) / RATING_CONST
end

def scale_rd(rd)
  rd / RATING_CONST
end

def g(rd)
  1.0 / Math.sqrt(1.0 + (3.0 * (scale_rd(rd) ** 2.0)) / (Math::PI ** 2.0))
end

def e(r1, r2, rd2)
  1.0 / (1.0 + Math.exp(-1 * g(rd2) * (scale_rating(r1) - scale_rating(r2))))
end

def calc_r_rd_est(cr, rate, rd)
  est = e(cr, rate, rd)
  (g(rd) ** 2) * est * (1 - est)
end

def quantity_v(cr, ratings, rds)
  ratings.each_with_index.inject(0) do |s, (rate, i)|
    s += calc_r_rd_est(cr, rate, rds[i])
  end ** -1
end

def quantity_delta(cr, ratings, rds, results, qv)
  ratings.each_with_index.inject(0) do |s, (rate, i)|
   s += g(rds[i]) * (results[i] - e(cr, rate, rds[i]))
  end * qv
end

def change_fun(x, a, cr, rd, qd, qv)
  (((Math::E ** x) * (qd ** 2 - g(rd) ** 2 - qv - Math::E ** x)) /
    (2 * (g(rd) ** 2 + qv + Math::E ** x) ** 2)) - ((x - a) / T ** 2)
end

def det_all(vol, cr, rd, ratings, rds, results)
  qd = quantity_delta(cr, ratings, rds, results)
  qv = quantity_v(cr, ratings, rds)
  convergence = 0.000001
  a = aA =  Math.log(vol ** 2, Math::E)
  if qd ** 2 > g(rd) ** 2 + qv
    bB =  Math.log(qd ** 2 - g(rd) ** 2 - qv, Math::E)
  else
  end
end


# TODO calculate new rating, new rd
