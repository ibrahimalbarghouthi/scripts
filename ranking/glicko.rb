RATING_CONST = 173.7178
RATING_DEFAULT = 1500.0
T = 1.2
Q = Math.log(10, Math::E) / 400.0

def scale_rating(r)
  (r - RATING_DEFAULT) / RATING_CONST
end

def scale_rd(rd)
  rd / RATING_CONST
end

def g(rd)
  1.0 / Math.sqrt(1.0 + (3.0 * (Q ** 2) * (rd ** 2.0)) / (Math::PI ** 2.0))
end

def e(r1, r2, rd2)
  1.0 / (1.0 + 10 ** (-1 * g(rd2) * (r1 - r2) / 400))
end

def calc_r_rd_est(cr, rate, rd)
  est = e(cr, rate, rd)
  (g(rd) ** 2) * est * (1 - est)
end

def quantity_d(cr, ratings, rds)
  (Q ** 2 * ratings.each_with_index.inject(0) do |s, (rate, i)|
    s += calc_r_rd_est(cr, rate, rds[i])
  end) ** -1
end


def new_r_rd(cr, rd, ratings, rds, results)
  d2 = quantity_d(cr, ratings, rds)
  val = ((1.0 / rd ** 2) + (1 / d2))
  new_r = cr + Q / val *
    ratings.each_with_index.inject(0) { |s, (rate, i)| s += g(rds[i]) * (results[i]- e(cr, rate, rds[i])) }

  new_rd = Math.sqrt(val ** -1)
  [new_r, new_rd]
end


puts new_r_rd(2500,30, [2500], [30], [0.5]).inspect


