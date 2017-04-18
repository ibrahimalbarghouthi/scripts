K = 32
def expected_score(r1, r2)
  1.0/(1.0 + 10.0 ** ((r2 - r1) / 400.0))
end

def new_score(r1, r2, result)
  r1 + K * (result - expected_score(r1, r2))
end

puts new_score(1500, 1500, 0.5)
