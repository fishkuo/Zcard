module BoardsHelper
  def board_title_css(board)
    "board-title board-title-#{board.state}"
  end

  # check?(board, :lock)
  # meta programming
  def check?(obj, type)
    obj.send("may_#{type}?") && policy(obj).send("#{type}?")
  end

  # def check_lock?(board)
  #   board.may_lock? && policy(board).lock?
  # end

  # def check_hide?(board)
  #   board.may_hide? && policy(board).hide?
  # end

  # def check_open?(board)
  #   board.may_open? && policy(board).open?
  # end
end
