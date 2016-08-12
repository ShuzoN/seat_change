module SeatPositionHelper


  def newline?(idx)
    return true if idx%8==0
    return false
  end

  def linecolor(idx)
    line_color = ["info","success","danger"]
    num=idx/8
    return line_color[num]
  end

end
