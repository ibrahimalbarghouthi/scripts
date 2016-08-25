# first_point = [500,500]
# half_radius = 125
#
def intersection( p0, p1, p2, p3 )

  s10_x = p1[0] - p0[0]
  s10_y = p1[1] - p0[1]
  s32_x = p3[0] - p2[0]
  s32_y = p3[1] - p2[1]

  denom = s10_x * s32_y - s32_x * s10_y

  denom_is_positive = denom > 0

    s02_x = p0[0] - p2[0]
    s02_y = p0[1] - p2[1]
    s_numer = s10_x * s02_y - s10_y * s02_x
      t_numer = s32_x * s02_y - s32_y * s02_x
      puts t_numer
      t = t_numer / denom
      puts t
        intersection_point = [ p0[0] + (t * s10_x), p0[1] + (t * s10_y) ]
        intersection_point
end
print intersection([-2,2],[2,0],[-2,0],[2,2])
sleepness = 0.2

radius = 157
cx = 960
cy = 540
angle = 0
ang_pi = angle * Math::PI
angle_dist = 0.1
x = cx + radius * Math.cos(ang_pi)
y = cy + radius * Math.sin(ang_pi)
c = x.to_i
h = y.to_i
system "xdotool mousemove #{x.to_i} #{y.to_i}"
angle += angle_dist
ang_pi = angle * Math::PI

  while true
    system "xdotool key KP_Enter"

    sleep(sleepness)
    if angle > 2
      angle = 0
      ang_pi = angle * Math::PI
    end
    x = cx + radius * Math.cos(ang_pi)
    y = cy + radius * Math.sin(ang_pi)
    system "xdotool mousemove #{x.to_i} #{y.to_i}"
    puts ang_pi
    angle += angle_dist
    ang_pi = angle * Math::PI
  end
