# first_point = [500,500]
# half_radius = 125

def intersection(a, b ,c, d)
  m1 = (b[1] - a[1]) / (b[0] - a[0])
  b1 =  a[1] - (m1 * a[0])
  puts b1
  m2 = (d[1] - c[1]) / (d[0] - c[0])
  b2 =  c[1] - (m2 * c[0])
  puts m1
  puts m2
  x =  (b2 - b1)/(m1 - m2)
  y = m1*x + b1
  [x,y]
end
print intersection([1.0,4.0],[50.0,102.0],[5.0,10.0],[10.0,-5.0])

while true
step = 36
radius = 200
x = 500
y = 500
fp_line = [x + radius,y]
dy_p_line = [x,y + radius]
#p_on_line must be more than 450 and less than 550
while dy_p_line[0] <=  fp_line[0] && dy_p_line[1] >= fp_line[1]  do
  system("cliclick m:#{dy_p_line[0]},#{dy_p_line[1]}")
  dy_p_line = [dy_p_line[0] + step, dy_p_line[1] - step]
end
fp_line = [x, y - radius]
dy_p_line = [x + radius , y]
while dy_p_line[0] >=  fp_line[0] && dy_p_line[1] >= fp_line[1]  do
  system("cliclick m:#{dy_p_line[0]},#{dy_p_line[1]}")
  dy_p_line = [dy_p_line[0] - step, dy_p_line[1] - step]
end

fp_line = [x - radius ,y]
dy_p_line = [x, x - radius]
#p_on_line must be more than 450 and less than 550
while dy_p_line[0] >= fp_line[0] && dy_p_line[1] <= fp_line[1]  do
  system("cliclick m:#{dy_p_line[0]},#{dy_p_line[1]}")
  dy_p_line = [dy_p_line[0] - step, dy_p_line[1] + step]
end
fp_line = [x, y + radius]
dy_p_line = [x - radius, y]
while dy_p_line[0] <=  fp_line[0] && dy_p_line[1] <= fp_line[1]  do
  system("cliclick m:#{dy_p_line[0]},#{dy_p_line[1]}")
  dy_p_line = [dy_p_line[0] + step, dy_p_line[1] + step]
end
end
