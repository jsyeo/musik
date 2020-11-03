require 'gnuplot'

def plot xs, ys
  Gnuplot.open do |gp|
    Gnuplot::Plot.new( gp ) do |plot|

      plot.title  "Array Plot Example"
      plot.xlabel "x"
      plot.ylabel "y"

      #x = (0..50).collect { |v| v.to_f }
      #y = x.collect { |v| v ** 2 }

      plot.data << Gnuplot::DataSet.new( [xs, ys] ) do |ds|
        ds.with = "linespoints"
        ds.notitle
      end
    end
  end
end

def clamp(x, min, max)
  if x < min then min else if x > max then max else x end end
end

def synth note
  freqs = {
    C4: 261.63,
    D4: 293.66,
    E4: 329.63,
    F4: 349.23,
    G4: 392,
    A4: 440,
    B4: 493.88,
    # ...
    E5: 659.2,
    D5: 587.3,
  }

  sample_rate = 8000
  range = 256

  # go from 0 to 256 freq[note] times a second at sample rate
  step = ((freqs[note] * range) / sample_rate).floor
  Enumerator.new do |y|
    p = 0
    loop do
      y.yield p
      p = (p + step)
    end
  end.lazy
end

def chord
  # c major chord
  c = [:C4, :E4, :G4]
  s1, s2, s3 = c.map { |n| synth(n) }
  s1.zip(s2, s3).take(8000).each do |x, y, z|
    res = x + y + z
    putc(res)
  end
end

def beatit
  [:E5, :B4, :D5, :E5, :D5, :B4 ,:A4, :B4].cycle.each do |n|
    synth(n).take(2000).each do |x|
      #print([x].pack("C"))
      putc(x)
    end
  end
end

chord

#xs = (0..100).take(20)
#  .tap { |y| puts y }
#plot xs, ys

